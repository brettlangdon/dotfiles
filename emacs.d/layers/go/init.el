(use-package go-mode
  :diminish go-mode
  :ensure t
  :init
  (setq gofmt-command "goimports")
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)

  (add-hook 'go-mode-hook (progn
                            (use-package company
                              :config
                              (use-package company-go)
                              (set (make-local-variable 'company-backends) '(company-go))
                              (company-mode))

                            (use-package flycheck-gometalinter)

                            (use-package go-eldoc
                              :ensure t
                              :config
                              (go-eldoc-setup))

                            (use-package godoctor
                              :ensure t)

                            (use-package go-guru
                              :ensure t))))
