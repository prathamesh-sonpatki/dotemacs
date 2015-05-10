;;; package --- summary

;;; Commentary:
;; General Settings

;;; Code:

;; Theme
(load-theme 'solarized-light t)

;; Font
(set-frame-font "Inconsolata XL 16")

;; Start in full screen mode
;;(toggle-frame-fullscreen)

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
(require 'grizzl)
(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-enable-caching t)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(setq projectile-indexing-method 'alien)
(add-to-list 'projectile-globally-ignored-directories "elpa")
(add-to-list 'projectile-globally-ignored-directories ".cache")
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(setq projectile-use-git-grep t)

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
(setq magit-last-seen-setup-instructions "1.4.0")

;; ag aka silver search
(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-buffers 't)

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
;;setq(setq initial-major-mode 'ruby-mode)
(setq initial-scratch-message nil)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

(require 'org-projectile)
(setq org-projectile:projects-file
      "/Users/prathamesh/Notes/projects.org")
(add-to-list 'org-capture-templates (org-projectile:project-todo-entry))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c n p") 'org-projectile:project-todo-completing-read)

;; anzu
(require 'anzu)
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Customize highlight color for Tango theme
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#000")
;; (set-face-foreground 'highlight nil)

(require 'helm-config)
(helm-mode 1)
(helm-adaptive-mode 1)
(helm-autoresize-mode 1)

;;; osx-clipboard
(require 'osx-clipboard)
(osx-clipboard-mode +1)

;; Emacs server
(load "server")
(unless (server-running-p) (server-start))

;; Bash completion
(require 'bash-completion)
(bash-completion-setup)

;; Remove C^M from shell output
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; Idomenu
(require 'idomenu)
(autoload 'idomenu "idomenu" nil t)

;;; pps-settings ends here
