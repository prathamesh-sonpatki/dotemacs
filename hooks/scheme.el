(add-hook 'scheme-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'inferior-scheme-mode-hook
          (lambda () (paredit-mode +1)))

(defun scheme-mode-quack-hook ()
  (require 'quack)
  (setq quack-fontify-style 'emacs))
(add-hook 'scheme-mode-hook 'scheme-mode-quack-hook)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
