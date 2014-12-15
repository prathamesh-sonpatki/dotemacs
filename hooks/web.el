;;; Commentary:

;;; Hooks for web mode

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))      ;; erb
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))    ;; plain html
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))     ;; jsx

(set-face-attribute 'web-mode-html-tag-face nil :foreground "Orange")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Purple")
(set-face-attribute 'web-mode-doctype-face nil :foreground "Blue")

(setq web-mode-engines-alist '(("erb" . "\\.erb\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-html-offset   2)
(setq web-mode-css-offset    2)
(setq web-mode-script-offset 2)
;;; web.el ends here
