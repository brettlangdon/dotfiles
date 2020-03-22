;; lsp-mode
;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  :hook (python-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :hook (python-mode . lsp)
  :commands lsp-ui-mode)

(use-package company-lsp
  :hook (python-mode . lsp))

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

;; Enable Flycheck for python
(enable-flycheck 'python-mode-hook)
