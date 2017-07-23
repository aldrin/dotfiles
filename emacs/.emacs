;; Get personal
(load "~/.ajd.el")
(load "~/.custom.el")
(load "~/.key-bindings.el")

;; Initialize
(require 'package)
(package-initialize)

;; Use use-package
(unless (package-installed-p 'use-package)
  (progn (package-refresh-contents)
         (package-install 'use-package)))
(eval-when-compile (require 'use-package))

;; Pick packages
(use-package json-mode :ensure t)
(use-package yaml-mode :ensure t)
(use-package drag-stuff :ensure t
  :config (drag-stuff-global-mode 1))
(use-package groovy-mode :ensure t
  :init (require 'cl))
(use-package bury-successful-compilation :ensure t
  :config (bury-successful-compilation 1))
(use-package markdown-mode :ensure t
  :config
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl)
  (add-hook 'before-save-hook 'ajd/orgtbl-to-markdown))
(use-package dockerfile-mode :ensure t)
(use-package better-defaults :ensure t)
(use-package magit :ensure t)
(use-package osx-clipboard :ensure t
  :config (osx-clipboard-mode +1))

;; Miscellaneous Settings
(fset 'yes-or-no-p 'y-or-n-p)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
