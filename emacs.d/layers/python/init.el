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

;; Enable Flycheck for python
(enable-flycheck 'python-mode-hook)
