;;; package --- summary

;;; Commentary:
;; General Settings

;;; Code:

;; Theme
(load-theme 'leuven)
;; (load-theme 'dracula)
;; (load-theme 'zenburn)
;; (load-theme 'gruvbox)
;; (load-theme 'monokai)
;; (load-theme 'dichromacy)
;; (load-theme 'tango-dark)

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

;; projectile
(require 'projectile)
(require 'grizzl)
(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'alien)
(add-to-list 'projectile-globally-ignored-directories "elpa")
(add-to-list 'projectile-globally-ignored-directories ".cache")
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories ".cask")
(setq projectile-use-git-grep t)

;; pallet
(require 'pallet)
(pallet-mode t)

;; web-mode
(require 'web-mode)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode 1)

;; magit
(defvar magit-last-seen-setup-instructions "1.4.0")

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
;; Don't downcase completions by company mode
(add-hook 'company-mode-hook '(lambda ()
                                (setq company-dabbrev-downcase nil)
                                (setq company-dabbrev-ignore-case nil)
                                ))

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

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-completion-system 'helm)

;; anzu
(require 'anzu)
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/snippets")))

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
(semantic-mode 1)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)
(setq helm-locate-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)

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

;; Change default browser for 'browse-url'  to w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)

;; Electric pair mode
(electric-pair-mode 1)

;; Git Gutter
(global-git-gutter-mode +1)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Alchemist
(require 'alchemist)

;; Avy
(require 'avy)
(avy-setup-default)

;; Beacon mode
(beacon-mode 1)

;; ElFeed
(defvar elfeed-feeds
  '(("http://feeds.feedburner.com/2ality" javascript)
    ("http://oremacs.com/atom.xml" emacs)
    ("http://blog.bigbinary.com/feed.xml" bigbinary)
    ("https://facebook.github.io/react/feed.xml" react)
    ("https://babeljs.io/feed.xml" babel javascript)
    ("http://endlessparentheses.com/atom.xml" emacs)
    ("http://pragmaticemacs.com/feed/" emacs)
    ("https://www.reddit.com/r/emacs/.rss" emacs)
    ("http://sachachua.com/blog/category/emacs/feed/" emacs sachachua)
    ("http://planet.emacsen.org/atom.xml" emacs)
    ("http://ergoemacs.org/emacs/blog.xml" emacs)
    ("http://blog.samaltman.com/posts.atom" general)
    ("http://feeds.feedburner.com/PlataformaBlog" ruby elixir)
    ))

;; Don't warn me about large files
(setq large-file-warning-threshold nil)

;; Ask for confirmation before closing emacs
(setq confirm-kill-emacs 'yes-or-no-p)

;; Always reload the file if it changed on disk
(global-auto-revert-mode 1)

(require 'fullframe)
(fullframe magit-status magit-mode-quit-window nil)

;; I want this for dired-jump
(require 'dired-x)

;; I usually want to see just the file names
(require 'dired-details)
(dired-details-install)

;; Nice listing
(setq find-ls-option '("-print0 | xargs -0 ls -alhd" . ""))

;; Always copy/delete recursively
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote top))

;; Auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Hide some files
(setq dired-omit-files "^\\..*$\\|^\\.\\.$")
(setq dired-omit-mode t)

;; List directories first
(defun sof/dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
   (let (buffer-read-only)
     (forward-line 2) ;; beyond dir. header
     (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))

(add-hook 'dired-after-readin-hook 'sof/dired-sort)

;; Aggressive indent
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'web-mode)

;; SML settings for Proglang
(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))

;; ELM
(require 'elm-mode)
(setq elm-format-on-save t)
(setq elm-tags-on-save t)
(add-hook 'flycheck-mode-hook 'flycheck-elm-setup)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-elm))
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
(add-hook 'elm-mode-hook
          (lambda ()
            (setq company-backends '(company-elm))))

(provide 'pps-settings)
;;; pps-settings ends here
