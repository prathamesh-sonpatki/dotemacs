;; Python

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
