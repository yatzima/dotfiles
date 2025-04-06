{
  description = "Yatzima's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, 
  homebrew-cask, ... }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.neovim
          pkgs.tmux
          pkgs.git
          pkgs.alacritty
          pkgs.mkalias
          pkgs.obsidian
          pkgs.spotify
          pkgs.emacs
          #pkgs.nerdfonts
        ];

      system.activationScripts.applications.text = let 
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in 
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
      '';

      system.defaults = {
        # Set autohide for dock
        dock.autohide = true;
        # Set applications to appear in dock
        dock.persistent-apps = [
          "/System/Applications/Mail.app"
          "/System/Applications/Calendar.app"
          #"/System/Applications/Safari.app"
          "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
          "/System/Applications/Messages.app"
          "/System/Applications/Notes.app"
          "${pkgs.spotify}/Applications/Spotify.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "/System/Applications/System Settings.app"
        ];
        finder.FXPreferredViewStyle = "clmv";
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        # Set default shell to alacritty

      };

      homebrew = {
        enable = true;
        casks = [
          "hammerspoon"
          "google-chrome"
          #"slack"
          #"visual-studio-code"
          #"font-jetbrains-mono-nerd-font"
        ];
        masApps = { 
          "Dashlane" = 517914548;
        };

        #onActivation.cleanup = "zap";
      };

      #fonts.packages = [
      #  (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      #];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      #nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mini" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            #enableRosetta = true;

            # User owning the Homebrew prefix
            user = "justinma";

            # Automatically migrate existing Homebrew installations
            #autoMigrate = true;

            # Optional: Declarative tap management
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };

            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            mutableTaps = false;
          };
        }
      ];
    };
  };
}
