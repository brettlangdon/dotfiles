;; https://github.com/kiwanami/emacs-epc/issues/35#issuecomment-756701267
(setq byte-compile-warnings '(cl-functions))

;; Fix for emacs 28.0.50 changing `define-obsolete-function-alias`
;; https://www.reddit.com/r/emacs/comments/kqb9s9/cannot_recompile_packagess_error_wrong_number_of/gj3cfn3/?utm_source=reddit&utm_medium=web2x&context=3
(load "~/.emacs.d/vendor/emacs_27_obsolete")


;; -- Startup optimizations --
;; The below will increase the GC limits and remove the file name regex checker
;; for 5 seconds. This helps reduce the number of GC calls and the total time spent
;; per file loaded
(progn
  ;; Set garbage collection threshold
  ;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
  (setq gc-cons-percentage-original gc-cons-percentage)
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
     (setq gc-cons-threshold (* 2 1000 1000))
     (setq gc-cons-percentage gc-cons-percentage-original)
     (setq file-name-handler-alist file-name-handler-alist-original)
     (makunbound 'gc-cons-percentage-original)
     (makunbound 'file-name-handler-alist-original))))


;; -- Core setup --
(progn
  ;; Current directory name, probably "~/emacs.d"
  (setq current-dir (file-name-directory (if load-file-name load-file-name "~/.emacs.d/")))

  ;; Configure customization
  (setq custom-file null-device)

  ;; Hide startup message
  (setq inhibit-startup-message t)

  ;; Configure package
  (require 'package)

  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("melpa-stable" . "https://stable.melpa.org/packages/")
                           ("gnu" . "https://elpa.gnu.org/packages/")
                           ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
  (customize-set-variable 'package-archive-priorities '(("gnu"    . 99)
                                                      ("nongnu" . 80)
                                                      ("stable" . 70)
                                                      ("melpa"  . 0)))
  (when (bound-and-true-p minimal-emacs-package-initialize-and-refresh)
  ;; Initialize and refresh package contents again if needed
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))

  ;; Install use-package if necessary
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  ;; Ensure use-package is available at compile time
  (setq use-package-always-ensure t)
  (eval-when-compile
    (require 'use-package)))

  ;; Disable backup files and auto-saving
  (setq backup-inhibited t
        make-backup-files nil
        auto-save-default nil
        auto-save-list-file-prefix nil)

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

  ;; Resolve symlinks when opening files, so that any operations are conducted
  ;; from the file's true directory (like `find-file').
  (setq find-file-visit-truename t
        vc-follow-symlinks t)

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
  ;; Enable global line numbers
  (global-display-line-numbers-mode t)

  ;; Hide menu bar
  (menu-bar-mode -1)

  ;; Highlight current line
  (global-hl-line-mode t)

  ;; Enable center cursor
  (use-package centered-cursor-mode
    :defer t
    :load-path "vendor/"
    :functions global-centered-cursor-mode
    :config
    (global-centered-cursor-mode))

  (use-package doom-themes
    :ensure t
    :config
    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled
    (load-theme 'doom-tokyo-night t))

  ;; Enable doom-modeline
  ;; https://seagle0128.github.io/doom-modeline/
  (use-package doom-modeline
    :ensure t
    :defer t
    :hook (after-init . doom-modeline-mode)))


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
    :defer t
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
    :defer t
    :requires helm)

  ;; Configure projectile
  ;; https://www.projectile.mx/en/latest/
  (use-package projectile
    :defer 1
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
  (use-package helm-projectile
    :defer 1)


  ;; Configure company-mode
  ;; http://company-mode.github.io/
  (use-package company
    :defer 1
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
    :defer 1
    :init
    (setq ws-butler-keep-whitespace-before-point nil
          require-final-newline t)
    :config
    (ws-butler-global-mode +1))


  ;; Configure diminish
  ;; https://github.com/myrjola/diminish.el
  (use-package diminish
    :defer t)


  ;; Smartparens
  ;; https://github.com/Fuco1/smartparens
  (use-package smartparens
    :defer t
    :diminish
    :config
    (smartparens-global-mode))

  (use-package auth-source
    :defer t
    :config
    (customize-set-variable 'auth-sources (quote (macos-keychain-internet macos-keychain-generic))))

  ;; ;; Magit
  ;; ;; https://magit.vc/
  ;; (use-package magit
  ;;   :defer 5
  ;;   :diminish)

  ;; ;; Forge
  ;; (use-package forge
  ;;   :defer 5
  ;;   :after magit
  ;;   :init
  ;;   (setq forge-topic-list-limit '(100 . 0 ))
  ;;   (setq forge-topic-list-columns
  ;;         '(("#" 5 forge-topic-list-sort-by-number (:right-align t) number nil)
  ;;           ("Title" 50 t nil title  nil)
  ;;           ("State" 10 t nil state nil)
  ;;           ("Author" 15 t nil author nil)
  ;;           )))

  ;; (defun forge-browse-buffer-file ()
  ;;   (interactive)
  ;;   (browse-url
  ;;    (let
  ;;        ((rev (magit-rev-abbrev "HEAD"))
  ;;         (repo (forge-get-repository 'stub))
  ;;         (file (magit-file-relative-name buffer-file-name))
  ;;         (highlight
  ;;          (if
  ;;              (use-region-p)
  ;;              (let ((l1 (line-number-at-pos (region-beginning)))
  ;;                    (l2 (line-number-at-pos (- (region-end) 1))))
  ;;                (format "#L%d-L%d" l1 l2))
  ;;            ""
  ;;            )))
  ;;      (forge--format repo "https://%h/%o/%n/blob/%r/%f%L"
  ;;                     `((?r . ,rev) (?f . ,file) (?L . ,highlight))))))

  ;; (defun forge-copy-buffer-file ()
  ;;   (interactive)
  ;;   (kill-new
  ;;    (let
  ;;        ((rev (magit-rev-abbrev "HEAD"))
  ;;         (repo (forge-get-repository 'stub))
  ;;         (file (magit-file-relative-name buffer-file-name))
  ;;         (highlight
  ;;          (if
  ;;              (use-region-p)
  ;;              (let ((l1 (line-number-at-pos (region-beginning)))
  ;;                    (l2 (line-number-at-pos (- (region-end) 1))))
  ;;                (format "#L%d-L%d" l1 l2))
  ;;            ""
  ;;            )))
  ;;      (forge--format repo "https://%h/%o/%n/blob/%r/%f%L"
  ;;                     `((?r . ,rev) (?f . ,file) (?L . ,highlight))))))

  (add-hook 'before-save-hook
            'whitespace-cleanup)

  (use-package lsp-mode
    :config
    (setq lsp-enable-file-watchers nil)
    (setq lsp-auto-guess-root t)
    (setq lsp-log-io nil)
    (setq lsp-restart 'auto-restart)
    (setq lsp-enable-symbol-highlighting nil)
    (setq lsp-enable-on-type-formatting nil)
    (setq lsp-signature-auto-activate nil)
    (setq lsp-signature-render-documentation nil)
    (setq lsp-eldoc-enable-hover t)
    (setq lsp-modeline-code-actions-enable nil)
    (setq lsp-modeline-diagnostics-enable nil)
    (setq lsp-headerline-breadcrumb-enable t)
    (setq lsp-semantic-tokens-enable nil)
    (setq lsp-enable-folding nil)
    (setq lsp-enable-imenu nil)
    (setq lsp-enable-snippet nil)
    (setq read-process-output-max (* 1024 1024)) ;; 1MB
    (setq lsp-idle-delay 0.5)
    :hook ((rust-mode . lsp)
          (rust-ts-mode . lsp)
          (python-mode . lsp)
          (python-ts-mode . lsp)
          (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

    (use-package lsp-ui
      :config
      (setq lsp-ui-doc-enable t)
      (setq lsp-ui-doc-header t)
      (setq lsp-ui-doc-show-with-cursor t)
      (setq lsp-ui-doc-include-signature t)
      (setq lsp-ui-doc-border (face-foreground 'default))
      (setq lsp-ui-sideline-enable t)
      (setq lsp-ui-sideline-show-code-actions t)
      (setq lsp-ui-sideline-delay 0.05)
      :commands lsp-ui-mode)

    (use-package helm-lsp
      :defer t
      :commands helm-lsp-workspace-symbol)

    (use-package wgrep-ag)

    (use-package ellama
      :ensure t
      :init
      (setopt ellama-language "English")
      (require 'llm-ollama)
      (setopt ellama-keymap-prefix "C-c e")
      (setopt ellama-provider
              (make-llm-ollama
               :chat-model "deepseek-coder:6.7b" :embedding-model "deepseek-coder:6.7b")))

    (use-package copilot
      :vc (:url "https://github.com/copilot-emacs/copilot.el"
           :rev :newest
           :branch "main")
      :init
      (add-hook 'prog-mode-hook 'copilot-mode))

    (use-package treesit-auto
     :custom
     (treesit-auto-install 'prompt)
     :config
     (treesit-auto-add-to-auto-mode-alist 'all)
     (global-treesit-auto-mode))

    ;; ;; Turn `C-]' into a sticky "super" modifier.
    (define-key local-function-key-map [?\C-\]] 'event-apply-super-modifier)
    ;; Move the global binding for C-] to C-s-]
    (define-key global-map [?\C-\s-\]] (lookup-key global-map [?\C-\]] t))
    (define-key global-map [?\C-\]] nil)

    ;; tab to complete copilot completions
    (define-key copilot-completion-map (kbd "C-c <tab>") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "C-c TAB") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "C-c n n") 'copilot-next-completion)
  )

;; -- Load layers --
(mapc 'load (file-expand-wildcards (expand-file-name "layers/*/*.el" current-dir)))
