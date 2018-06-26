(setq inhibit-startup-message t)

;;;
;;; mode settings
;;;


;; 
;; grep
;; 
(setq grep-host-defaults-alist nil) 
(setq grep-template "grep <C> -n <R> <F> <N>")
(setq grep-find-template "find . <X> -type f <F> -print0 | xargs -0 -e grep <C> -n <R> <N>") 

;;
;; desktop-save
;;
(desktop-save-mode 1)



;;
;; undo-tree
;;
(global-undo-tree-mode t)


;;
;; js mode
;;
(setq auto-mode-alist (cons '("\\.js$" . js-mode) auto-mode-alist))

;;
;; php mode
;;
(autoload 'php-mode "php-mode" nil t)
(setq auto-mode-alist (cons '("\\.ctp" . php-mode) auto-mode-alist))

;;
;; c mode
;;
(add-hook 'c-mode-common-hook
		  '(lambda ()
			 (progn
;			   (semantic-mode 1) ; CEDET
			   (c-toggle-hungry-state 1)
			   (c-set-style "linux")
			   (setq tab-width 4)
			   (setq indent-tabs-mode nil)
			   (setq c-basic-offset 4))))
;;
;; ocaml 
;;
;;(autoload 'tuareg-mode "tuareg" nil t)
;;(setq auto-mode-alist (cons '("\\.ml$" . tuareg-mode) auto-mode-alist))
;; (add-hook 'tuareg-mode-hook
;; 		  '(lambda ()
;; 			 (progn
;; 			   (setq indent-tabs-mode nil)
;; 			   (setq ff-other-file-alist
;; 					 '(("\\.ml$" (".mli"))
;; 					   ("\\.mli$" (".ml"))))
;; 			   (define-key tuareg-mode-map (kbd "C-c o") 'ff-find-other-file)
;; 			   (setq tab-width 4))))

;;
;; common lisp
;;
(setq auto-mode-alist (cons '("\\.cl$" . lisp-mode) auto-mode-alist))
(add-hook 'lisp-mode-hook
		  '(lambda ()
			 (progn
			   (setq indent-tabs-mode nil)			
			   (setq tab-width 4))))
(when (require 'cl-indent-patches nil t)
  ;; emacs-lispのインデントと混同しないように
  (setq lisp-indent-function
        (lambda (&rest args)
          (apply (if (memq major-mode '(emacs-lisp-mode lisp-interaction-mode))
                     'lisp-indent-function
                     'common-lisp-indent-function)
                 args))))
;;
;; slime
;;
;(setq inferior-lisp-program "sbcl")
;(setq slime-net-coding-system 'utf-8-unix)
;(eval-after-load "slime"
;  '(progn (slime-setup '(slime-repl))))
;(require 'slime)


