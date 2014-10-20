;; -*- mode: lisp; -*-
(prefer-coding-system 'utf-8)
(menu-bar-mode 0)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq vc-follow-symlinks t)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(color-theme-initialize)
(color-theme-monokai)

(setq backup-inhibited t)
(setq auto-save-default nil)
(setq require-final-newline t)
(setq mode-require-final-newline t)
(define-key global-map (kbd "RET") 'newline-and-indent)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)

(global-hl-line-mode 1)
(set-face-background hl-line-face "#333")
(global-linum-mode 1)
(setq linum-format "%4d |")
(set-face-attribute 'linum nil :background "#000" :foreground "#FFF")
(global-git-gutter-mode 1)

(setq mouse-wheel-mode 0)
(setq mouse-wheel-up-event 0)
(setq mouse-wheel-down-event 0)
(require 'centered-cursor-mode)
(global-centered-cursor-mode +1)

(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(setq fci-rule-column 100)
(setq fci-rule-width 1)
(setq fci-rule-color "yellow")

(display-time-mode 1)
(display-battery-mode 1)

(global-set-key (kbd "C-c a") 'org-agenda)
(helm-mode 1)
(projectile-global-mode 1)
(global-subword-mode 1)
(add-hook 'find-file-hook (lambda()
                            (flymake-find-file-hook)
                            (flymake-cursor-mode)))

(add-hook 'web-mode-hook (lambda()
                           (auto-complete-mode)
                           (setq web-mode-markup-indent-offset 2)
                           (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "white")))
(add-hook 'php-mode-hook (lambda()
                           (auto-complete-mode)
                           (flymake-php-mode)))
(add-hook 'markdown-mode-hook (lambda()
                                (require 'poly-markdown)
                                (poly-markdown-mode 1)
                                (flyspell-mode 1)
                                (setq fci-rule-column 80)))
(add-hook 'python-mode-hook (lambda()
                              (auto-complete-mode)
                              (elpy-mode)
                              (highlight-indentation-mode 0)))


(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\tpl.*.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\tag.*.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
