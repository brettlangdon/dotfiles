;; Markdown-mode
;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :diminish gfm-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :init (setq markdown-command "multimarkdown"))
