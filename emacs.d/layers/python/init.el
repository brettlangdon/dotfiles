;; Do not notify the user each time Python tries to guess the indentation offset
(setq python-indent-guess-indent-offset-verbose nil)

;; lsp-mode
(use-package lsp-pyright
  :defer t
  :ensure t
  :init
  (setq lsp-pyright-auto-import-completions t)
  (setq lsp-pyright-langserver-command "basedpyright")
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;; Enable pip-requirements when editing a `requirements.txt` file
(use-package pip-requirements
  :defer t
  :mode ("requirements\\.txt" . pip-requirements-mode)
  :diminish pip-requirements-mode)

;; Enable cython-mode when editing a `*.pyx` file
(use-package cython-mode
  :defer t
  :ensure t
  :mode ("\\.pyx" . cython-mode)
  :diminish cython-mode)

(use-package sphinx-doc
  :defer t
  :hook (python-mode . sphinx-doc-mode)
  :commands sphinx-docs-mode)


(add-hook 'before-save-hook 'lsp-format-buffer)
