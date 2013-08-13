; load all the other good things
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/powerline-2.2")

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

;auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;enable package manager
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(require 'flymake-cursor)
(add-hook 'find-file-hook 'flymake-find-file-hook)

(require 'projectile)
(setq projectile-completion-system 'grizzl)
(setq projectile-use-native-indexing t)
(setq projectile-enable-caching t)
(projectile-global-mode)

(elpy-enable)

;call gofmt on the script when saving
(add-hook 'go-mode-hook
	  '(lambda ()
	     (add-hook 'before-save-hook 'gofmt)))

;solarize ALL the things
(color-theme-initialize)
(color-theme-clarity)
(require 'powerline)
(powerline-default-theme)
