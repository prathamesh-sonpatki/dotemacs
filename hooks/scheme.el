(add-hook 'scheme-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'inferior-scheme-mode-hook
          (lambda () (paredit-mode +1)))
