(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(use-package go-mode
  :defer t
  :diminish go-mode
  :ensure t
  :mode (("\\.go\\'" . go-mode))
  :init
  (setq rust-format-on-save t)
  :hook (go-mode . (lambda ()
                     (lsp)))
  :hook (go-mode . lsp-go-install-save-hooks))
