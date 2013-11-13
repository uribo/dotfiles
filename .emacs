;;for Mac
(setq mac-allow-anti-aliasing nil)
(setq mac-option-modifer 'meta)
(setq load-path (cons "~/.emacs.d/elisp/" load-path))
;;(require 'redo+)
(require 'mac-key-mode)
;;(mac-key-mode 1)

;;for Japanese
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(add-to-list 'default-frame-alist '(font . "fontset-default"))

(setq backup-dir "~/.emacs.d/backup/")
(setq backup-by-copying t) (fset 'make-backup-file-name
				 '(lambda (file) (concat (expand-file-name backup-dir)
							  (file-name-nondirectory file)) )) 

(load-file "~/.emacs.d/elisp/auto-complete.el")
(load-file "~/.emacs.d/elisp/dictionary-config.el")
(load-file "~/.emacs.d/elisp/mac-key-mode.el")
(load-file "~/.emacs.d/elisp/popup.el")
(load-file "~/.emacs.d/elisp/redo+.el")

;;自動補完
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;;set-mode-alist
(setq auto-mode-alist
      (append
       '(
	   ("\\.html$" . html-helper-mode)
	     ) auto-mode-alist))

;;起動メッセージを表示しない
;;(setq inhibit-startup-message t)

;;elisp
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-acr)
(setq load-path (cons "~/.emacs.d/elisp/html-helper-mode" load-path))
(require 'html-helper-mode)
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(add-to-list 'auto-mode-alist '("\\.html$" . html-helper-mode))
(add-hook 'html-helper-mode-hook '(lambda () (font-lock-mode 1)))

;;ESS
(add-to-list 'load-path "~/.emacs.d/elisp/ess-12.09/lisp/")
(require 'ess-site)
(setq auto-mode-alist           (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
;;(setq-default inferior-R-program-name "/Library/Frameworks/R.framework/Resources/bin/R")

;;color
(global-font-lock-mode t)                                        ; S/R   tex(set-face-foreground 'font-lock-comment-face       "Firebrick")  ; #com  %com
(set-face-foreground 'font-lock-string-face         "SeaGreen")  ; "str" "str"
(set-face-foreground 'font-lock-keyword-face      "MediumBlue")  ; if    \end(set-face-foreground 'font-lock-constant-face      "VioletRed")  ; fun<- {ctr}
(set-face-foreground 'font-lock-type-face      "DarkGoldenrod")  ; T,F    ?
(set-face-foreground 'font-lock-variable-name-face      "Blue")  ; xv
(set-face-foreground 'font-lock-function-name-face "VioletRed")  ; <-    {eq1}

;;syou先生
;;(defun ess:format-window-1 ()
;;  (split-window-horizontally)
;;  (other-window 1)
;;  (split-window)
;;  (other-window 1))
;;(add-hook 'ess-pre-run-hook 'ess:format-window-1)

;; かつどん先生
;; yatex
(setq load-path (cons "/Applications/Emacs.app/Contents/Resources/site-lisp/yatex" load-path))
(require 'yatex)
(setq auto-mode-alist          (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; TeXShopでプレビュー
(setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8"
            dvi2-command "open -a Preview.app")
;; 漢字code
(setq YaTeX-kanji-code 4)

;;simple-hatena-mode
(setq load-path (cons "~/.emacs.d/elisp/simple-hatena-mode/" load-path))
(require 'simple-hatena-mode)

;;zencoding-mode
(setq load-path (cons "~/.emacs.d/elisp/zencoding/" load-path))
(require 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
;;(add-hook 'text-mode-hook 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap "\C-return" nil)
(define-key zencoding-mode-keymap "\C-a"  'zencoding-expand-line)
(define-key zencoding-preview-keymap "\C-a"  'zencoding-preview-accept)

;; Dictionary.app を Emacs から引いてファイルに書き出す
;; (+ "http://d.hatena.ne.jp/a666666/20100529/1275138722"
;;    "http://sakito.jp/mac/dictionary.html"
;;    "http://d.hatena.ne.jp/tomoya/20091218/1261138091"
;;    "http://d.hatena.ne.jp/tomoya/20100103/1262482873")
(defvar dict-bin "~/opt/local/bin/dict.py"
  "dict 実行ファイルのパス")
(defvar dict-log-file "~/Dropbox/english.txt"
  "dict ログを書き出すファイル")
(defun my-dictionary ()
  (interactive)
  (let ((pt (save-excursion (mouse-set-point last-nonmenu-event)))
        (old-buf (current-buffer))
        (dict-buf (get-buffer-create "*dictionary.app*"))
        (log-buf (find-file-noselect dict-log-file))
        beg end)
    (if (and mark-active
             (<= (region-beginning) pt) (<= pt (region-end)))
        (setq beg (region-beginning)
              end (region-end))
      (save-excursion        (goto-char pt)
        (setq end (progn (forward-word) (point)))
        (setq beg (progn (backward-word) (point)))
        ))
    (setq word (buffer-substring-no-properties beg end))
    (set-buffer dict-buf)
    (erase-buffer)
    (call-process dict-bin                  nil "*dictionary.app*" t word
                  "Japanese-English" "Japanese" "Japanese Synonyms")
    (setq dict (buffer-string))
    (set-buffer log-buf)
    (goto-char (point-max))
    (insert (concat (current-time-string) "\n" word "\n"))
    (insert-buffer dict-buf)
    (save-current-buffer)
    (set-buffer old-buf)
    (when (not (eq (length dict) 0))
      (popup-tip dict :margin t :scroll-bar t) t)
    ))
;(defvar dict-timer nil)
;(defvar dict-delay 1.0)
;(defun dict-timer ()
;  (when (and (not (minibufferp))
;             (and mark-active transient-mark-mode))
;    (ns-popup-dictionary)))
;(setq dict-timer (run-with-idle-timer dict-delay dict-delay 'dict-timer))
(define-key global-map (kbd "C-M-d") 'my-dictionary)

;;;---------------------------------
;;; R & ESS の設定
;;;---------------------------------
;; パスの追加
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/ess")
(add-to-list 'auto-mode-alist '("\\.[rR]$" . R-mode))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
(setq ess-loaded-p nil)
(defun ess-load-hook (&optional from-iess-p)
  ;; インデントの幅を4にする（デフォルト2）
  ;;(setq ess-indent-level 4)
  ;; インデントを調整
  ;;(setq ess-arg-function-offset-new-line (list ess-indent-level))
  ;; comment-region のコメントアウトに # を使う（デフォルト##）
  (make-variable-buffer-local 'comment-add)
  (setq comment-add 0)
;; 最初に ESS を呼び出した時の処理
  (when (not ess-loaded-p)
    ;; アンダースコアの入力が " <- " にならないようにする
    (ess-toggle-underscore nil)
    ;; C-c r を押した際に表示される候補数の上限値
    (setq anything-R-help-limit 40)
    (setq anything-R-local-limit 20)
    ;; C-c r で R の関数やオブジェクトを検索できるようにする
    (when (require 'anything-R nil t)
      ;; ess-smart-comma が導入されたので repospkg と localpkg はあまり必要なさそう
      (setq anything-for-R-list '(anything-c-source-R-help
                                  anything-c-source-R-local))
      (define-key ess-mode-map (kbd "C-c r") 'anything-for-R)
      (define-key inferior-ess-mode-map (kbd "C-c r") 'anything-for-R))
    ;; C-c C-g で オブジェクトの内容を確認できるようにする
    (require 'ess-R-object-popup nil t)
    ;; 補完機能を有効にする
   ;; (setq ess-use-auto-complete t)
    ;; anything を使いたいので IDO は邪魔
    (setq ess-use-ido nil)
    ;; キャレットがシンボル上にある場合にもエコーエリアにヘルプを表示する
    (setq ess-eldoc-show-on-symbol t)
    ;; 起動時にワーキングディレクトリを尋ねられないようにする
    (setq ess-ask-for-ess-directory nil)
    ;; # の数によってコメントのインデントの挙動が変わるのを無効にする
    (setq ess-fancy-comments nil)
    (setq ess-loaded-p t)
    (unless from-iess-p      ;; ウィンドウが1つの状態で *.R を開いた場合はウィンドウを縦に分割して R を表示する
      (when (one-window-p)
        (split-window-horizontally)
        (let ((buf (current-buffer)))
          (ess-switch-to-ESS nil)
          (switch-to-buffer-other-window buf)))
      ;; R を起動する前だと auto-complete-mode が off になるので自前で on にする
      ;; cf. ess.el の ess-load-extras
      (when (and ess-use-auto-complete (require 'auto-complete nil t))
        (add-to-list 'ac-modes 'ess-mode)
        (mapcar (lambda (el) (add-to-list 'ac-trigger-commands el))
                '(ess-smart-comma smart-operator-comma skeleton-pair-insert-maybe))
        (setq ac-sources '(ac-source-R ac-source-filename)))))
(if from-iess-p
      ;; R のプロセスが他になければウィンドウを分割する
      (if (> (length ess-process-name-list) 0)
          (when (one-window-p)
            (split-window-horizontally)
            (other-window 1)))
    ;; *.R と R のプロセスを結びつける
    ;; これをしておかないと補完などの便利な機能が使えない
    (ess-force-buffer-current "Process to load into: ")))

;; R-mode 起動直後の処理
(add-hook 'R-mode-hook 'ess-load-hook)

;; R 起動直前の処理
(add-hook 'ess-pre-run-hook (lambda () (ess-load-hook t)))


;;patch
