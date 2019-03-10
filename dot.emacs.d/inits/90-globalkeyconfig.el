(global-set-key (kbd "C-x C-j") 'skk-mode)
(global-set-key (kbd "M-/") 'undo-tree-redo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(global-set-key (kbd "C-x C-l") 'indent-buffer)
