; load all the other good things
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/powerline-2.2")
(add-to-list 'load-path "~/.emacs.d/elpa/projectile-0.9.2")

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;disable abbrev-mode
(setq default-abbrev-mode nil)

;final newline
(setq require-final-newline t)
(setq mode-require-final-newline t)

;highlight current line
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray13")
;enable line numbers
(global-linum-mode 1)
(custom-set-variables '(linum-format (quote "%3d |")))

;remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;disable vc-git (dont use it and too slow to start up)
(setq vc-handled-backends nil)

;dont use tabs!
(setq-default indent-tabs-mode nil)

;auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;enable package manager
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(require 'flymake-cursor)
(add-hook 'find-file-hook 'flymake-find-file-hook)

(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-mode)

(require 'projectile)
(setq projectile-completion-system 'grizzl)
(setq projectile-enable-caching t)
(projectile-global-mode t)

(elpy-enable)

;call gofmt on the script when saving
(add-hook 'go-mode-hook
	  '(lambda ()
	     (add-hook 'before-save-hook 'gofmt)))

;js-mode overwrites json-mode when loading .json files, so this is
; to force json-mode for .json files
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;solarize ALL the things
(color-theme-initialize)
(color-theme-clarity)
(require 'powerline)
(powerline-default-theme)

; http://blog.lathi.net/articles/2007/11/07/sharing-the-mac-clipboard-with-emacs
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
