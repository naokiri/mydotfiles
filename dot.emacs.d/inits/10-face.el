;;
;; face environment
;;

(setq load-path
      (append (list
               (expand-file-name "~/.emacs.d/site-lisp/")
               (expand-file-name "~/.emacs.d/elpa/"))
              load-path))

(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8)

;; truncuate line when in 2 or more windows.
(setq truncate-partial-width-windows nil)

(setq default-tab-width 4)
(setq indent-tabs-mode nil)

(set-default-font "Liberation Mono-13")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("M+1P+IPAG" . "unicode-bmp"))

(if (boundp 'window-system)
    (progn                                        
      (setq initial-frame-alist
            (append (list
                     '(foreground-color . "azure3") ; 文字が白
                     '(background-color . "black") ; 背景は黒
                     '(border-color     . "black")
                     '(mouse-color      . "white")
                     '(cursor-color     . "white")
                     '(cursor-type      . box)
                     '(menu-bar-lines . 1)
                     '(vertical-scroll-bars . nil) ;;スクロールバーはいらない
                     )
                    initial-frame-alist))))
(setq default-frame-alist initial-frame-alist)

;;
;; show paren
;;
(show-paren-mode t)
(setq show-paren-style 'mixed)


(when (>= emacs-major-version 26)
  (set-face-attribute 'show-paren-match nil
                      :background "LightSlateBlue"
                      :foreground "LightCyan"
                      :underline "Yellow"))

(when (<= emacs-major-version 25)
  (set-face-background 'show-paren-match-face "LightSlateBlue")
  (set-face-foreground 'show-paren-match-face "LightCyan")
  (set-face-underline-p 'show-paren-match-face "Yellow"))

