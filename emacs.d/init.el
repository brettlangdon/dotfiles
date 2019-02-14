;; -- Startup optimizations --
;; The below will increase the GC limits and remove the file name regex checker
;; for 5 seconds. This helps reduce the number of GC calls and the total time spent
;; per file loaded
(progn
  ;; Set garbage collection threshold
  ;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
  (setq gc-cons-threshold-original gc-cons-threshold
        gc-cons-percentage-original gc-cons-percentage)
  (setq gc-cons-threshold (* 1024 1024 100)
        gc-cons-percentage 0.6)

  ;; Set file-name-handler-alist
  ;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
  (setq file-name-handler-alist-original file-name-handler-alist)
  (setq file-name-handler-alist nil)

  ;; Set deferred timer to reset them
  ;; https://emacs.stackexchange.com/a/34367
  (run-with-idle-timer
   5 nil
   (lambda ()
     (setq gc-cons-threshold gc-cons-threshold-original)
     (setq gc-cons-percentage gc-cons-percentage-original)
     (setq file-name-handler-alist file-name-handler-alist-original)
     (makunbound 'gc-cons-threshold-original)
     (makunbound 'gc-cons-percentage-original)
     (makunbound 'file-name-handler-alist-original))))


;; -- Core setup --
(progn
  ;; Current directory name, probably "~/emacs.d"
  (setq current-dir (file-name-directory (if load-file-name load-file-name "~/.emacs.d/")))

  ;; Configure customization
  (setq custom-file (expand-file-name "custom.el" current-dir))
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

  ;; Spaces are better than tabs
  (setq-default indent-tabs-mode nil
                tab-width 2)

  ;; revert buffers automatically when underlying files are changed externally
  (global-auto-revert-mode t)

  ;; Subword mode
  (global-subword-mode)

  ;; Use `newline-and-indent` when pressing enter
  (define-key global-map (kbd "RET") 'newline-and-indent)

  ;; Save place in file
  (save-place-mode 1)

  ;; Enable both of these commands
  (put 'downcase-region 'disabled nil)
  (put 'upcase-region 'disabled nil)

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
  (setq tab-always-indent 'complete))


;; -- Custom functions --
(progn
  (defun enable-flycheck (hook)
    (add-hook hook
	            ;; Flycheck
	            ;; http://www.flycheck.org/en/latest/index.html
	            `(lambda ()
		             (use-package flycheck
		               :diminish flycheck-mode
		               :config
		               (flycheck-mode))))))


;; -- Theme/Style setup --
(progn
  (use-package monokai-theme
    :config
    (load-theme 'monokai t))

  ;; Enable global line numbers
  (global-linum-mode t)

  ;; Hide menu bar
  (menu-bar-mode -1)

  ;; Highlight current line
  (global-hl-line-mode t)

  ;; Enable center cursor
  (use-package centered-cursor-mode
    :load-path "vendor/"
    :functions global-centered-cursor-mode
    :config
    (global-centered-cursor-mode))

  ;; Enable doom-modeline
  ;; https://seagle0128.github.io/doom-modeline/
  (use-package doom-modeline
    :ensure t
    :defer t
    :hook (after-init . doom-modeline-init)))


;; -- Global packages --
(progn
  ;; Configure osx-clipboard
  ;; https://github.com/joddie/osx-clipboard-mode
  (use-package osx-clipboard
    :diminish osx-clipboard-mode
    :config
    (osx-clipboard-mode t))

  ;; Configure helm
  ;; https://emacs-helm.github.io/helm/
  (setq personal-keybindings nil)
  (use-package helm-config
    :ensure helm
    :diminish helm-mode
    :bind (("M-x" . helm-M-x)
	         ("C-x b" . helm-mini)
	         ("C-x C-f" . helm-find-files))
    :init
    (setq helm-move-to-line-cycle-in-source t
	        helm-M-x-always-save-history t)
    :config
    (helm-mode 1))

  (use-package helm-ag
    :requires helm)

  ;; Configure projectile
  ;; https://www.projectile.mx/en/latest/
  (use-package projectile
    :delight '(:eval (concat " " (projectile-project-name)))
    :functions (projectile-project-p
                projectile-project-root
                projectile-current-project-dirs
                projectile-file-cached-p)
    :config
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (projectile-mode +1)
    ;; Use helm-projectile
    :config
    (setq projectile-completion-system 'helm
	        projectile-switch-project-action 'helm-projectile)
    (helm-projectile-on))

  ;; Configure helm-projectile
  ;; https://github.com/bbatsov/helm-projectile
  (use-package helm-projectile)


  ;; Configure company-mode
  ;; http://company-mode.github.io/
  (use-package company
    :diminish company-mode
    :init
    (setq company-idle-delay 0.2
	        company-minimum-prefix-length 2
	        company-require-match nil
	        company-dabbrev-ignore-case nil
	        company-dabbrev-downcase nil)
    :config
    (global-company-mode))


  ;; Configure ws-butler
  ;; https://github.com/lewang/ws-butler
  (use-package ws-butler
    :init
    (setq ws-butler-keep-whitespace-before-point nil
	        require-final-newline t)
    :config
    (ws-butler-global-mode +1))


  ;; Configure diminish
  ;; https://github.com/myrjola/diminish.el
  (use-package diminish)


  ;; Smartparens
  ;; https://github.com/Fuco1/smartparens
  (use-package smartparens
    :diminish
    :config
    (smartparens-global-mode)))


;; -- Load layers --
(mapc 'load (file-expand-wildcards (expand-file-name "layers/*/*.el" current-dir)))
