;; Global packages

;; Configure osx-clipboard
;; https://github.com/joddie/osx-clipboard-mode
(use-package osx-clipboard
  :diminish osx-clipboard-mode
  :config
  (osx-clipboard-mode t))

;; Configure helm
;; https://emacs-helm.github.io/helm/
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
  (use-package helm-ag)
  (helm-mode 1))

;; Configure projectile
;; https://www.projectile.mx/en/latest/
(use-package projectile
  :delight '(:eval (concat " " (projectile-project-name)))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-global-mode +1)
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
  (smartparens-global-mode))
