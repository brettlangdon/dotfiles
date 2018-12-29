(add-hook 'python-mode-hook
	  (lambda ()
	    ;; Anaconda mode
	    ;; https://github.com/proofit404/anaconda-mode
	    (use-package anaconda-mode
	      :diminish anaconda-mode
	      :config
	      (anaconda-mode)
	      (anaconda-eldoc-mode))

	    ;; Company anaconda
	    ;; https://github.com/proofit404/company-anaconda
	    (use-package company-anaconda
	      :init
	      (eval-after-load "company"
		'(add-to-list 'company-backends 'company-anaconda)))
	    (use-package eldoc
	      :diminish eldoc-mode
	      :config
	      (eldoc-mode))

	    (enable-flycheck)))
