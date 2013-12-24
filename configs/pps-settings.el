;; Theme
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-day t)

;; Custom Font - Monaco
(set-face-attribute 'default nil :height 120 :family "Fira Mono OT")

;; Start in full screen mode
(toggle-frame-fullscreen)

; Allows syntax highlighting to work
(global-font-lock-mode 1)

;; Display time
(display-time-mode t)

;; linum mode
(global-linum-mode t)

;; autocomplete
(require 'auto-complete)
(global-auto-complete-mode t)

;; nrepl autocomplete
(require 'ac-nrepl)

;;; No GUI
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Adding leim to load path
(add-to-list 'load-path "/usr/share/emacs/24.3/leim")

;; Using org-mode-crate by Vedang

(add-to-list 'load-path "/home/cha1tanya/Projects/sources/org-mode-crate/")
(setq org-directory "/home/cha1tanya/Notes")
(require 'org-mode-crate-init)

;; powerline
(require 'powerline)
(powerline-default-theme)

(provide 'pps-settings)

;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-rails-expand-snippet nil)
(setq projectile-switch-project-action 'projectile-dired)

;; ace jump mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; pallet
(require 'pallet)

;; web-mode
(require 'web-mode)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode 1)

;; magit
(require 'magit-commit-training-wheels)

;; ag aka silver search
(require 'ag)
(setq ag-highlight-search t)
