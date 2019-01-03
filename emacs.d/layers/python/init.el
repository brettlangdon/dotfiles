;; Anaconda mode
;; https://github.com/proofit404/anaconda-mode
(use-package anaconda-mode
  :diminish anaconda-mode
  :requires eldoc
  :after eldoc
  :init
  (add-hook 'python-hook #'anaconda-mode)
  (add-hook 'python-hook #'anaconda-eldoc-mode))

;; Company anaconda
;; https://github.com/proofit404/company-anaconda
(use-package company-anaconda
  :mode ("\\.py" . python-mode)
  :after (company anaconda-mode)
  :init
  (add-hook 'python-hook
            (eval-after-load "company"
              '(add-to-list 'company-backends 'company-anaconda))))

;; Enable eldoc mode
(use-package eldoc
  :diminish eldoc-mode
  :init
  (add-hook 'python-mode #'eldoc-mode))

;; Enable pip-requirements when editing a `requirements.txt` file
(use-package pip-requirements
  :mode ("requirements\\.txt" . pip-requirements-mode)
  :diminish pip-requirements-mode)

;; Enable Flycheck for python
(enable-flycheck 'python-mode-hook)
