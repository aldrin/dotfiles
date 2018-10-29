;;; ajd.el --- My humble elisp functions.
;;; Commentary:
;;; Code:

(defun ajd/orgtbl-to-markdown ()
  "Org tables format is slightly different from how GFM expects tables to be."
  (when (eq major-mode 'markdown-mode)
    (save-excursion
      (goto-char (point-min))
      (while (search-forward "-+-" nil t) (replace-match "-|-")))))

(defun ajd/hook/org-mode ()
  "My org-mode hooks"
  (turn-on-flyspell)
  (if buffer-file-name
      ((set (make-local-variable 'compile-command)
       (concat "make -k " (file-name-sans-extension buffer-file-name) ".pdf")))))

(provide 'ajd)

;;; .ajd.el ends here
