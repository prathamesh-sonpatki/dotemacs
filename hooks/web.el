;;; Commentary:

;;; Hooks for web mode

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))      ;; erb
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))    ;; plain html
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))        ;; jsx
(add-to-list 'auto-mode-alist '("\\.es6$" . web-mode))        ;; ES6

(set-face-attribute 'web-mode-html-tag-face nil :foreground "Red")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Blue")
(set-face-attribute 'web-mode-doctype-face nil :foreground "Green")

(setq web-mode-engines-alist '(("erb" . "\\.erb\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq web-mode-enable-auto-pairing t)

(setq web-mode-enable-css-colorization t)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;;; web.el ends here
