(add-hook 'yaml-ts-mode-hook
          (lambda () (add-hook 'before-save-hook 'whitespace-cleanup nil 'local)))
