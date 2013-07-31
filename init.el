;; init.el

;; configure load path
(setq load-path (cons "~/.emacs.d" load-path))

(setq root-dir "~/.emacs.d")

(setq configs-dir (concat root-dir "/configs"))
(add-to-list 'load-path configs-dir)

(setq hooks-dir (concat root-dir "/hooks"))
(add-to-list 'load-path hooks-dir)

(setq logs-dir (concat root-dir "/logs"))

(require 'auto-package)

(defvar my-packages '(melpa

                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      textmate
                      ;; themes
                      color-theme-sanityinc-solarized
                      molokai-theme

                      ;; clojure
                      clojure-mode
                      clojure-test-mode
                      clojurescript-mode
                      nrepl
                      ac-nrepl

                      ;; ruby
                      rinari
                      rspec-mode

                      ;; js
                      js2-mode
                      coffee-mode

                      ;; markup
                      haml-mode
                      less-css-mode
                      sass-mode
                      scss-mode
                      markdown-mode

                      ;; flymake
                      flymake-shell
                      flymake-ruby
                      flymake-haml
                      flymake-css

                      ;; navigation
                      ack-and-a-half
                      ascope

                      ;; editing
                      auto-complete
                      smooth-scrolling
                      browse-kill-ring
                      undo-tree
                      yasnippet

                      ;; utils
                      magit
                      melpa
                      todochiku
                      multiple-cursors
                      paredit
                      multi-term
                      rings
                      rcirc
                      )
  "A list of packages to ensure are installed at launch.")

(auto-package-install my-packages)

(require 'pps-rcirc)
(require 'pps-multi-term)

;; Custom Font - Monaco

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :family "Monaco"))))
 '(magit-item-highlight ((t nil))))

;; My Own Key Bindings

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-i" 'rvm-gem-install)
(global-set-key "\C-x\C-x" 'eval-buffer )
(global-set-key "\C-x\C-r" 'quickrun)
(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)))

; Allows syntax highlighting to work

(global-font-lock-mode 1)

;; Adding leim to load path

(add-to-list 'load-path "/usr/share/emacs/24.1/leim")

;; Display time

(display-time-mode t)

;; Using org-mode-crate by Vedang

(add-to-list 'load-path "/home/cha1tanya/Projects/sources/org-mode-crate/")
(setq org-directory "/home/cha1tanya/Notes")
(require 'org-mode-crate-init)

;; Adding leim to load path

(add-to-list 'load-path "/usr/share/emacs/24.2/leim")

(add-hook 'scheme-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'inferior-scheme-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'clojure-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'emacs-lisp-mode-hool
          (lambda () (paredit-mode +1)))

(defun jw-indent-block (n)
  (interactive "p")
  (indent-rigidly (region-beginning) (region-end) (* tab-width n)))

(defun jw-outdent-block (n)
  (interactive "p")
  (jw-indent-block (* -1 n)))

(add-hook 'shell-mode-hook '(lambda () (setq show-trailing-whitespace nil)))

(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (edit-server-start)))

;; autocomplete

(require 'auto-complete)
(global-auto-complete-mode t)

;; nrepl autocomplete

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

;; autocomplete using TAB
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook
 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook
 'nrepl-interaction-mode-hook
 'set-auto-complete-as-completion-at-point-function)

;; ac-nrepl popup doc
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks"))

;; linum mode
(global-linum-mode t)

;; whitespace mode
(global-whitespace-mode t)
;; make whitespace-mode use just basic coloring
(setq whitespace-style (quote
                        (spaces tabs newline space-mark tab-mark newline-mark)))

;;; No GUI
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
