;; lsp-mode
(use-package lsp-pyright
  :ensure t
  :init (setq lsp-pyright-auto-import-completions t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;; Enable pip-requirements when editing a `requirements.txt` file
(use-package pip-requirements
  :mode ("requirements\\.txt" . pip-requirements-mode)
  :diminish pip-requirements-mode)

;; Enable cython-mode when editing a `*.pyx` file
(use-package cython-mode
  :ensure t
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

;; Enable `isort`ing files
;; https://github.com/paetzke/py-isort.el
(use-package py-isort
  :demand t
  :after python
  :hook (before-save . py-isort-before-save))

;; Enable Flycheck for python
(enable-flycheck 'python-mode-hook)

(require 'dap-python)
