(use-package monokai-theme
  :config
  (load-theme 'monokai t))

;; Enable global line numbers
(global-linum-mode t)

;; Hide menu bar
(menu-bar-mode -1)

;; Enable center cursor
(use-package centered-cursor-mode
  :load-path "vendor/"
  :diminish centered-cursor-mode
  :config
  (global-centered-cursor-mode))
