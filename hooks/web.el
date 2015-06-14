;;; package -- Summary:

;;; Commentary:

;;; Hooks for web mode

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))      ;; ERB
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))    ;; plain html
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))        ;; jsx
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))         ;; plain JavaScript
(add-to-list 'auto-mode-alist '("\\.es6$" . web-mode))        ;; ES6
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))        ;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . web-mode))       ;; SCSS

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "js")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq web-mode-enable-auto-pairing t)

(setq web-mode-enable-css-colorization t)

;; disable jshint since we prefer eslint checking
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (web-mode-set-content-type "jsx")
            (message "now set to: %s" web-mode-content-type)))

(require 'react-snippets)

;;; web.el ends here
