;;;;
;;;; emacs config file
;;;;

;;
;; necessary configs for editing inits
;;
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "\C-h") 'delete-backward-char)
(global-set-key (kbd "\C-x ?") 'help)
(global-set-key (kbd "\C-t") 'ESC-prefix)

;;
;; environment
;;
(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(setq syncing-packages
      '(
        init-loader
        package-utils
        ddskk
        undo-tree
        ))

(when (not package-archive-contents) (package-refresh-contents))

(dolist (pkg syncing-packages)
    (when (and (not (package-installed-p pkg)) (assoc pkg package-archive-contents))
        (package-install pkg)))

;; TODO?: pacakage-list-packages U,x update all packages, automatically here?
;; TODO?: package-utils-upgrade-by-name init-loader?
(init-loader-load)

