;;; package --- summary

;;; Commentary:
;; General Settings

;;; Code:

;; Theme
(require 'color-theme-sanityinc-tomorrow)
;;(load-theme 'sanityinc-tomorrow-day t)
(load-theme 'monokai t)

;; Custom Font - Monaco
(set-face-attribute 'default nil :height 180 :weight 'normal :family "Menlo")

;; Start in full screen mode
(toggle-frame-fullscreen)

; Allows syntax highlighting to work
(global-font-lock-mode 1)

;; Display time
(display-time-mode t)

;; linum mode
(global-linum-mode t)

;;; No GUI
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(provide 'pps-settings)

;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-rails-expand-snippet nil)
(setq projectile-switch-project-action 'projectile-dired)

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

;; Trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable spell check
(add-hook 'find-file-hooks 'turn-on-flyspell)

;; Set guru mode
(guru-global-mode +1)

;; Enable company mode
(global-company-mode t)
(push 'company-robe company-backends)

;; Scratch buffer configuration
(setq initial-major-mode 'ruby-mode)
(setq initial-scratch-message nil)
;;; pps-settings ends here
