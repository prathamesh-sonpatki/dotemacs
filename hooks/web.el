(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))      ;; erb
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) ;; mustache
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))    ;; plain html
