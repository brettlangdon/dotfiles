(defun enable-flycheck (hook)
  (add-hook hook
	    ;; Flycheck
	    ;; http://www.flycheck.org/en/latest/index.html
	    `(lambda ()
	       (use-package flycheck
		 :diminish flycheck-mode
		 :config
		 (flycheck-mode)))))
