(setq load-path (cons "~/.emacs.d" load-path))
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
                      )

  "A list of packages to ensure are installed at launch.")

(auto-package-install my-packages)

;; Custom Font - Monaco

(custom-set-faces
 '(default ((t (:height 130 :family "Monaco"))))
 '(magit-item-highlight ((t nil)) t))

;; My Own Key Bindings

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-i" 'rvm-gem-install)
(global-set-key "\C-x\C-x" 'eval-buffer )
(global-set-key "\C-x\C-r" 'quickrun)

;; Activate rvm

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

; Allows syntax highlighting to work

(global-font-lock-mode 1)

;; Adding leim to load path

(add-to-list 'load-path "/usr/share/emacs/24.1/leim")


(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)

  ;; Custom file types to which Ruby mode is applied

  (add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Isolate\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'"   . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

  ;; Ruby mode hook
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))

;; Custom file types to which Coffee mode is applied

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; RHTML

(add-to-list 'load-path "~/.emacs.d/elpa/rhtml")
(require 'rhtml-mode)

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

;; Yaml mode hook

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

;; css mode hook

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

;; Display time

(display-time-mode t)

;; Using org-mode-crate by Vedang

(add-to-list 'load-path "/home/cha1tanya/Projects/sources/org-mode-crate/")
(setq org-directory "/home/cha1tanya/Notes")
(require 'org-mode-crate-init)

;; Adding leim to load path

(add-to-list 'load-path "/usr/share/emacs/24.2/leim")

(add-hook 'abg-code-modes-hook
          (lambda () (linum-mode 1)))

(add-hook 'ruby-mode-hook
          (lambda () (run-hooks 'abg-code-modes-hook)))

(add-hook 'scheme-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'inferior-scheme-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'clojure-mode-hook
          (lambda () (paredit-mode +1)))

(add-hook 'emacs-lisp-mode-hool
          (lambda () (paredit-mode +1)))

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda () (coffee-custom)))

(defun jw-indent-block (n)
  (interactive "p")
  (indent-rigidly (region-beginning) (region-end) (* tab-width n)))

(defun jw-outdent-block (n)
  (interactive "p")
  (jw-indent-block (* -1 n)))

(add-hook 'shell-mode-hook '(lambda () (setq show-trailing-whitespace nil)))

;; Python

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

;; Personal keybindings

(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)))

;; multi-term

(setq multi-term-program "/bin/zsh -l")

(when (require 'multi-term nil t)
  (global-set-key (kbd "<f5>") 'multi-term)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (setq multi-term-buffer-name "term"
        multi-term-program "/bin/zsh"))

(when (require 'term nil t) ; only if term can be loaded..
  (setq term-bind-key-alist
        (list (cons "C-c C-c" 'term-interrupt-subjob)
              (cons "C-p" 'previous-line)
              (cons "C-n" 'next-line)
              (cons "M-f" 'term-send-forward-word)
              (cons "M-b" 'term-send-backward-word)
              (cons "C-c C-j" 'term-line-mode)
              (cons "C-c C-k" 'term-char-mode)
              (cons "M-DEL" 'term-send-backward-kill-word)
              (cons "M-d" 'term-send-forward-kill-word)
              (cons "<C-left>" 'term-send-backward-word)
              (cons "<C-right>" 'term-send-forward-word)
              (cons "C-r" 'term-send-reverse-search-history)
              (cons "M-p" 'term-send-raw-meta)
              (cons "M-y" 'term-send-raw-meta)
              (cons "C-y" 'term-send-raw))))

(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (edit-server-start)))

;; rings https://github.com/konr/rings

(require 'rings)
(global-set-key (kbd "<f2>")   (rings-generate-cycler 2))
(global-set-key (kbd "C-<f2>") (rings-generate-setter 2))
(global-set-key (kbd "<f3>")   (rings-generate-cycler 3))
(global-set-key (kbd "C-<f3>") (rings-generate-setter 3))
(global-set-key (kbd "<f4>")   (rings-generate-cycler 4))
(global-set-key (kbd "C-<f4>") (rings-generate-setter 4))

;; autocomplete

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
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; ac-nrepl popup doc
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
