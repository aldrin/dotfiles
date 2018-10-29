;;; .custom.el --- Customizations
;;; Commentary: My workspace customizations
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bury-successful-compilation t)
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-file "~/.custom.el")
 '(exec-path-from-shell-check-startup-files nil)
 '(fill-column 100)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote org-mode))
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (bury-successful-compilation htmlize terraform-mode drag-stuff osx-clipboard groovy-mode web-mode dockerfile-mode better-defaults powershell toml-mode yaml-mode json-mode exec-path-from-shell cargo flymake-easy flymake-rust rust-mode use-package)))
 '(ring-bell-function (quote ignore))
 '(rust-format-on-save t)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell t))
;;; .custom.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 150 :family "Fira Code")))))
