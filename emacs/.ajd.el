;;; ajd.el --- My humble elisp functions.
;;; Commentary:
;;; Code:
(defun ajd/orgtbl-to-markdown ()
  "Org tables format is slightly different from how GFM expects tables to be."
  (when (eq major-mode 'markdown-mode)
    (save-excursion
      (goto-char (point-min))
      (while (search-forward "-+-" nil t) (replace-match "-|-")))))

(defun ajd/wip ()
  "Save current state as a 'work in progress' commit."
  (interactive)
  (magit-stage-modified)
  (magit-commit (list "-m" "gwip")))

(provide 'ajd)

;;; .ajd.el ends here
