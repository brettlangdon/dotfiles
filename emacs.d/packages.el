;; Global packages

;; Configure osx-clipboard
;; https://github.com/joddie/osx-clipboard-mode
(use-package osx-clipboard
  :diminish osx-clipboard-mode
  :config
  (osx-clipboard-mode t))

;; Configure helm
;; https://emacs-helm.github.io/helm/
(use-package helm
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files))
  :config
  (use-package helm-ag)
  (helm-mode 1))


;; Configure projectile
;; https://www.projectile.mx/en/latest/
(use-package projectile
  :diminish projectile-mode
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  ;; Use helm-projectile
  (use-package helm-projectile
    :config
    (setq projectile-switch-project-action 'helm-projectile)
    (helm-projectile-on)))


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
(use-package ws-butler)


;; Configure diminish
;; https://github.com/myrjola/diminish.el
(use-package diminish)


;; Smartparens
;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :config
  (smartparens-global-mode))
