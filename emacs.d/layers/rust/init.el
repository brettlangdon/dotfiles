(use-package rust-mode
  :defer t
  :diminish rust-mode
  :ensure t
  :mode (("\\.rs\\'" . rust-mode))
  :init
  (setq rust-format-on-save t))
