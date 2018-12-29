;; Configure customization
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Hide startup message
(setq inhibit-startup-message t)

;; Configure package and use-package
(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Disable backup files and auto-saving
(setq backup-inhibited t)
(setq auto-save-default nil)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Whitespace
;; Newline at end of file
(setq require-final-newline t)
(add-hook 'before-save-hook 'whitespace-cleanup)
(whitespace-mode)

;; Subword mode
(global-subword-mode)

;; Enable global line numbers
(global-linum-mode t)


;; Custom functions
;; DEV: Load this last
(load "~/.emacs.d/funcs.el")
