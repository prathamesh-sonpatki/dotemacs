;;; package -- summary:

;;; Commentary:
;;; Hooks for jsx mode

;;; Code

(require 'flycheck)

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (jsx-mode))
(add-hook 'jsx-mode-hook (lambda ()
                           (flycheck-select-checker 'jsxhint-checker)
                           (flycheck-mode)))

(add-hook 'jsx-mode-hook (lambda () (auto-complete-mode 1)))

(add-hook 'jsx-mode-hook (lambda () (tern-mode t)))

;;; jsx.el ends here
