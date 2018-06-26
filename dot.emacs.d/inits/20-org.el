;;
;; org, org-journal, etc related
;;
(setq org-startup-indented t)
(setq org-startup-truncated t)

(setq org-journal-dir "~/memo/jounal/")
;(setq org-journal-file-format "")
(setq org-extend-today-until 2)
(setq org-journal-date-format "%Y-%m-%d")

(defun org-mode-hooks ()
  (progn 
    (define-key org-mode-map (kbd "C-c f") 'org-metaright)
    (define-key org-mode-map (kbd "C-c b") 'org-metaleft)
    (define-key org-mode-map (kbd "C-c p") 'org-metaup)
    (define-key org-mode-map (kbd "C-c n") 'org-metadown)))

(add-hook 'org-mode-hook 'org-mode-hooks)


(defun org-journal-mode-hooks ()
  (progn
    (setq org-todo-keywords
          '((sequence "<" ">" "|" "X")))))
         
(add-hook 'org-journal-mode-hook 'org-journal-mode-hooks)


;; (add-hook 'org-journal-after-entry-create-hook
;;             (lambda ()
;;               (save-excursion
;;                 (let ((template "#TODO"))
;;                   (beginning-of-buffer)
;;                   (unless (search-forward template nil t)
;;                     (insert template "\n\n"))))))


