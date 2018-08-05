;;;;
;;;; emacs config file
;;;;

;;
;; necessary configs for editing inits
;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq-default indent-tabs-mode nil)
(global-set-key (kbd "\C-h") 'delete-backward-char)
(global-set-key (kbd "\C-x ?") 'help)
(global-set-key (kbd "\C-t") 'ESC-prefix)

;;
;; package environment
;;
(let ((bootstrap-file (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; (setq syncing-packages
;;       '(
;;         init-loader
;;         package-utils
;;         ddskk
;;         undo-tree
;;         org-journal
;;         which-key
;;         ))

;(dolist (package-name syncing-packages)
;  (straight-use-package package-name))


(use-package init-loader)
(init-loader-load "~/.emacs.d/inits")

