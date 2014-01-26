;; Hooks for coffee mode

;;; Code:
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; Set tab width for coffee mode
(setq coffee-tab-width 2)

;;; coffee.el ends here
