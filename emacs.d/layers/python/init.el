;; Anaconda mode
;; https://github.com/proofit404/anaconda-mode
(use-package anaconda-mode
  :hook python-mode
  :diminish anaconda-mode
  :requires eldoc
  :after eldoc
  :config
  (anaconda-mode)
  (anaconda-eldoc-mode))

;; Company anaconda
;; https://github.com/proofit404/company-anaconda
(use-package company-anaconda
  :hook python-mode
  :after (company anaconda-mode)
  :init
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda)))

;; Enable eldoc mode
(use-package eldoc
  :mode ("\\.py" . python-mode)
  :diminish eldoc-mode
  :config
  (eldoc-mode))

;; Enable pip-requirements when editing a `requirements.txt` file
(use-package pip-requirements
  :mode ("requirements\\.txt" . pip-requirements-mode)
  :diminish pip-requirements-mode
  :config
  (pip-requirements-mode))

;; Enable Flycheck for python
(enable-flycheck 'python-mode-hook)
