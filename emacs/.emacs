;;; .emacs --- emacs init file
;;; Commentary:
;;; Code:
(load "~/.ajd.el")
(load "~/.custom.el")
(load "~/.key-bindings.el")
(if (file-exists-p "~/.local.el")(load "~/.local.el"))

;; Initialize
(require 'package)
(package-initialize)

;; Use use-package
(unless (package-installed-p 'use-package)
  (progn (package-refresh-contents)
         (package-install 'use-package)))
(eval-when-compile (require 'use-package))

;; Pick packages
(use-package magit :ensure t)
(use-package cargo :ensure t)
(use-package flx-ido :ensure t)
(use-package rust-mode :ensure t)
(use-package adoc-mode :ensure t)
(use-package json-mode :ensure t)
(use-package yaml-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package powershell :ensure t)
(use-package ace-window :ensure t)
(use-package material-theme :ensure t)
(use-package better-defaults :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package web-mode :ensure t :mode "\\.html\\'")
(use-package projectile :ensure t :config (projectile-mode))
(use-package yasnippet :ensure t :config (yas-global-mode 1))
(use-package flycheck :ensure t :config (global-flycheck-mode))
(use-package groovy-mode :ensure t :defer t :init (require 'cl))
(use-package osx-clipboard :ensure t :config (osx-clipboard-mode +1))
(use-package uniquify :config (setq uniquify-buffer-name-style 'forward))
(use-package drag-stuff :ensure t
  :config (drag-stuff-global-mode 1) (drag-stuff-define-keys))
(use-package bury-successful-compilation :ensure t
  :config (bury-successful-compilation 1))
(use-package markdown-mode :ensure t
  :config (add-hook 'markdown-mode-hook 'flyspell-mode)
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl)
  (add-hook 'before-save-hook 'ajd/orgtbl-to-markdown))
(use-package flycheck-rust :ensure t
  :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(use-package go-mode :ensure t :config
  (add-hook 'go-mode-hook
            (lambda ()(add-hook 'before-save-hook 'gofmt-before-save))))

;; Miscellaneous Settings
(fset 'yes-or-no-p 'y-or-n-p)
(load-theme 'material)


;;; .emacs ends here
