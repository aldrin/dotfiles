;;; ajd.el --- My humble elisp functions.
;;; Commentary:
;;; Code:

(defun ajd/orgtbl-to-markdown ()
  "Org tables format is slightly different from how GFM expects tables to be."
  (when (eq major-mode 'markdown-mode)
    (save-excursion
      (goto-char (point-min))
      (while (search-forward "-+-" nil t) (replace-match "-|-")))))

(provide 'ajd)

;;; .ajd.el ends here
