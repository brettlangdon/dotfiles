  ;; Enable xit-mode
  ;; https://github.com/ryanolsonx/xit-mode/
  ;; https://xit.jotaen.net/
  (load "~/.emacs.d/vendor/xit-mode.el")
  (add-hook 'xit-mode-hook
          '(lambda ()
             (setq tab-width 4)))
