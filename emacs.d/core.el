;; Configure customization
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Hide startup message
(setq inhibit-startup-message t)

;; Configure package
(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure use-package
;; https://github.com/jwiegley/use-package
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Disable backup files and auto-saving
(setq backup-inhibited t)
(setq auto-save-default nil)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Subword mode
(global-subword-mode)

;; Save place in file
(save-place-mode 1)

;; Save history
(setq savehist-additional-variables '(mark-ring
				      global-mark-ring
				      search-ring
				      regexp-search-ring
				      extended-command-history)
      savehist-autosave-interval 60
      enable-recursive-minibuffers t
      history-length 1000)
(savehist-mode 1)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; Custom functions
;; DEV: Load this last
(load "~/.emacs.d/funcs.el")
