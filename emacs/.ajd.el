; Convert orgtbl '-+-' to gfm friendly '-|-'
(defun ajd/orgtbl-to-markdown ()
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "-+-" nil t) (replace-match "-|-"))))
