;;; .key-bindings.el --- My custom key bindings
;;; Commentary:
;;; Code:

;; My Keybindings
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

(global-set-key (kbd "M-s M-s") 'magit-status)
(global-set-key (kbd "M-s M-p") 'ace-window)
(global-set-key (kbd "M-g w") 'ajd/wip)
(global-set-key (kbd "M-c") 'compile)

(provide '.key-bindings)
;;; .key-bindings.el ends here
