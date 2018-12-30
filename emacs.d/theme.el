(use-package monokai-theme
  :config
  (load-theme 'monokai t))

;; Enable global line numbers
(global-linum-mode t)

;; Hide menu bar
(menu-bar-mode -1)

;; Highlight current line
(global-hl-line-mode t)

;; Enable center cursor
(use-package centered-cursor-mode
  :load-path "vendor/"
  :config
  (global-centered-cursor-mode))

;; Enable doom-modeline
;; https://seagle0128.github.io/doom-modeline/
(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))
