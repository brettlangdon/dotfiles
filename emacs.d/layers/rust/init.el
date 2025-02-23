(use-package rust-mode
 :diminish rust-ts-mode
 :ensure t
 :init
 (setq rust-mode-treesitter-derive t)
 (setq rust-format-on-save t))
