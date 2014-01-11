(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))      ;; erb
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) ;; mustache
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))    ;; plain html
(set-face-attribute 'web-mode-html-tag-face nil :foreground "Orange")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Purple")
(set-face-attribute 'web-mode-doctype-face nil :foreground "Blue")

(setq web-mode-engines-alist '(("ruby"    . "\\.erb\\'")))

;;(remove-hook 'prog-mode-hook 'esk-pretty-lambdas)
;;(remove-hook 'prog-mode-hook 'esk-add-watchwords)
;;(remove-hook 'prog-mode-hook 'idle-highlight-mode)
