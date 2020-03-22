(add-to-list 'auto-mode-alist '("\\.mjs\\'" . javascript-mode))
(setq js-indent-level 2
      typescript-indent-level 2
      mmm-js-mode-enter-hook (lambda () (setq syntax-ppss-table nil))
      mmm-typescript-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package vue-mode
  :ensure t)
(use-package vue-html-mode
  :ensure t)
