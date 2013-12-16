;;#########################################
;;changed 131215
;;#########################################
(defun add-to-load-path (&rest paths)
	(let (path)
		(dolist (path paths paths)
			(let ((default-directory (expand-file-name (concat user-emacs-directory path))))
			(add-to-list 'load-path default-directory)
			(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
				(normal-top-level-add-subdirs-to-load-path))))))
;; elisp とconf ディレクトリをサブディレクトリごとload.pathに追加
(setq load-path (cons "~/.emacs.d/elisp/" load-path))

;;auto-install
;;(install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(when (require 'auto-install nil t)
	(setq auto-install-directory "~/.emacs.d/elisp")
	(auto-install-update-emacswiki-package-name t)
	(auto-install-compatibility-setup))

;;(install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(when (require 'redo+ nil t))
	;;global-map
	(global-set-key (kbd "C-'") 'redo) ;C-'にredoを割り当てる	

;;color-theme
(when (require 'color-theme nil t)
	(color-theme-initialize)
	(color-theme-gray30))

;;自動補完
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;;for Japanese
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(add-to-list 'default-frame-alist '(font . "fontset-default"))

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

(setq backup-dir "~/.emacs.d/backup/")
(setq backup-by-copying t) (fset 'make-backup-file-name
                                 '(lambda (file) (concat (expand-file-name backup-dir)
                                                          (file-name-nondirectory file)) )) 

;;color
(global-font-lock-mode t)                                        ; S/R   tex(set-face-foreground 'font-lock-comment-face       "Firebrick")  ; #com  %com
(set-face-foreground 'font-lock-string-face         "SeaGreen")  ; "str" "str"
(set-face-foreground 'font-lock-keyword-face      "MediumBlue")  ; if    \end(set-face-foreground 'font-lock-constant-face      "VioletRed")  ; fun<- {ctr}
(set-face-foreground 'font-lock-type-face      "DarkGoldenrod")  ; T,F    ?
(set-face-foreground 'font-lock-variable-name-face      "Blue")  ; xv
(set-face-foreground 'font-lock-function-name-face "VioletRed")  ; <-    {eq1}


;;(setq inhibit-startup-screen t) ;スタートアップメッセージを非表示
;;(tool-bar-mode 0)
;;(scroll-bar-mode 0)
;;(menu-bar-mode 0)


;;for Mac
;;(setq mac-allow-anti-aliasing nil)
;;(setq mac-option-modifer 'meta)
;;(require 'mac-key-mode)
;;(mac-key-mode 1)
