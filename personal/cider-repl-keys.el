(add-hook 'cider-repl-mode-hook
          (lambda ()
            (define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)
            (define-key cider-repl-mode-map (kbd "C-c M-l") 'cider-repl-switch-to-other)))
