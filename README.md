# dotfiles

This repo contains my dotfiles and configuration files for various applications
and tools I use. The goal is to keep my development environment consistent
across different machines.

I try to manage all packages using Nix.

## Installation
1. Install [Nix Package Manager](https://nixos.org/download/)
```bash
sh <(curl -L https://nixos.org/nix/install)
```

2. Clone this repository
```bash
nix-shell -p git --run "git clone https://github.com/yatzima/dotfiles.git ~/.dotfiles"
```

3. Install using Nix
```bash
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch
--flake ~/.dotfiles/nix#mini

4. To rebuild using Nix
```bash
darwin-rebuild switch --flake ~/.dotfiles/nix#mini
```
