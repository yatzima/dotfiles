;; @yatzima
;; Set up package.el to work with MELPA
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/") 
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(package-selected-packages '(org org-modern elpy org-babel-eval-in-repl evil)))
(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
)

;; Enable Org
(require 'org)
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)

;; Enable IPython as default
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; Enable multiple languages in a single Org file
(org-babel-do-load-languages 
  'org-babel-load-languages 
  '((python . t) 
    (shell . t)
    ;; Add other languages here
))                      
