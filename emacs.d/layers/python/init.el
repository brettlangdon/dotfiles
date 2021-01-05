(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-ui
  :ensure t
  :hook (python-mode . lsp)
  :commands lsp-ui-mode)

(use-package company-lsp
  :commands company-lsp)

;; Enable pip-requirements when editing a `requirements.txt` file
(use-package pip-requirements
  :mode ("requirements\\.txt" . pip-requirements-mode)
  :diminish pip-requirements-mode)

;; Enable cython-mode when editing a `*.pyx` file
(use-package cython-mode
  :mode ("\\.pyx" . cython-mode)
  :diminish cython-mode)

(use-package sphinx-doc
  :hook (python-mode . sphinx-doc-mode)
  :commands sphinx-docs-mode)

;; Enable `black`ing files
;; https://github.com/wbolster/emacs-python-black
(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode))

;; Enable Flycheck for python
(enable-flycheck 'python-mode-hook)
