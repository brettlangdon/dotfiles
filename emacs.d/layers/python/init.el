;; Anaconda mode
;; https://github.com/proofit404/anaconda-mode
(use-package anaconda-mode
  :diminish anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

;; Company anaconda
;; https://github.com/proofit404/company-anaconda
(use-package company-anaconda
  :mode ("\\.py" . python-mode)
  :after (company anaconda-mode)
  :config
  (add-to-list 'company-backends 'company-anaconda))

;; Enable eldoc mode
(use-package eldoc
  :diminish eldoc-mode
  :config
  (add-hook 'python-mode 'eldoc-mode))

;; Enable pip-requirements when editing a `requirements.txt` file
(use-package pip-requirements
  :mode ("requirements\\.txt" . pip-requirements-mode)
  :diminish pip-requirements-mode)

;; Enable Flycheck for python
(enable-flycheck 'python-mode-hook)
