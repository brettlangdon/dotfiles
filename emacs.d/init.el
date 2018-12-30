(eval-and-compile
  (progn
    ;; Startup optimizations
    (load "~/.emacs.d/startup.el")

    ;; Configure core required setup
    (load "~/.emacs.d/core.el")

    ;; Configure theme
    (load "~/.emacs.d/theme.el")

    ;; Configure global packages
    (load "~/.emacs.d/packages.el")

    ;; Load all layers
    (mapc 'load (file-expand-wildcards "~/.emacs.d/layers/*/*.el"))))
