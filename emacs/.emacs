;;; .emacs --- emacs init file
;;; Commentary:
;;; Code:
(load "~/.ajd.el")
(load "~/.key-bindings.el")

;; Load custom settings
(if (file-exists-p "~/.custom.el")(load "~/.custom.el"))
(if (file-exists-p "~/.local.el")(load "~/.local.el"))

;; Initialize package subsystem
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use use-package
(unless (package-installed-p 'use-package)
  (progn (package-refresh-contents)
         (package-install 'use-package)))
(eval-when-compile (require 'use-package))

;; General setup
(use-package exec-path-from-shell :ensure t)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Packages
(use-package htmlize :ensure t)
(use-package json-mode :ensure t)
(use-package yaml-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package powershell :ensure t)
(use-package better-defaults :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package web-mode :ensure t :mode "\\.html\\'")
(use-package groovy-mode :ensure t :defer t :init (require 'cl))
(use-package osx-clipboard :ensure t :config (osx-clipboard-mode +1))
(use-package uniquify :config (setq uniquify-buffer-name-style 'forward))
(use-package drag-stuff :ensure t
  :config (drag-stuff-global-mode 1) (drag-stuff-define-keys))

;; Hook things up
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Programming Setup
(load "~/.languages/rust.el")


;; Miscellaneous Settings
(fset 'yes-or-no-p 'y-or-n-p)

;;; .emacs ends here
