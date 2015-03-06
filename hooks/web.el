;;; Commentary:

;;; Hooks for web mode

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))      ;; erb
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))    ;; plain html
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))     ;; jsx


(set-face-attribute 'web-mode-html-tag-face nil :foreground "Red")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Blue")
(set-face-attribute 'web-mode-doctype-face nil :foreground "Green")

(setq web-mode-engines-alist '(("erb" . "\\.erb\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-html-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
;;; web.el ends here
