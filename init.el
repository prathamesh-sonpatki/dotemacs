;; Marmalade configuration

(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Custom Font - Monaco

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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

;; Load whiteboard theme

(load-theme 'whiteboard t)

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

;; Enable paredit mode

(require 'paredit)

;; Rcodetools
(add-to-list 'load-path "/home/cha1tanya/.emacs.d/elpa/rcodetools")
(require 'rcodetools)
(require 'anything)
;; (require 'icicles-rcodetools)
(require 'anything-rcodetools)
;; (describe-function 'xmp)
;; (describe-function 'comment-dwim)
;; (describe-function 'rct-complete-symbol)
;; (describe-function 'rct-ri)
;; (describe-variable 'rct-find-tag-if-available)
;; (describe-function 'rct-fork)
;; (describe-function 'rct-fork-kill)

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


(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                         ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-0.8.0/snippets"    ;; the default collection
        ))
(yas-global-mode 1)

;; Python

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

;; Auto Complete

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")
 
(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-yasnippet
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic))
 
(ac-config-default)
 
(dolist (m '(c-mode c++-mode java-mode ruby-mode python-mode clojure-mode scheme-mode coffee-mode javascript-mode))
  (add-to-list 'ac-modes m))
 
(global-auto-complete-mode t)

;; Personal keybindings

(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)))

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; RSense
(require 'rsense)

;; Complete by C-c .
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; twittering mode
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; multi-term

(require 'multi-term)
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

(when (require 'term nil t)
  (defun term-handle-ansi-terminal-messages (message)
    (while (string-match "\eAnSiT.+\n" message)
      ;; Extract the command code and the argument.
      (let* ((start (match-beginning 0))
             (command-code (aref message (+ start 6)))
             (argument
              (save-match-data
                (substring message
                           (+ start 8)
                           (string-match "\r?\n" message
                                         (+ start 8))))))
        ;; Delete this command from MESSAGE.
        (setq message (replace-match "" t t message))
 
        (cond ((= command-code ?c)
               (setq term-ansi-at-dir argument))
              ((= command-code ?h)
               (setq term-ansi-at-host argument))
              ((= command-code ?u)
               (setq term-ansi-at-user argument))
              ((= command-code ?e)
               (save-excursion
                 (find-file-other-window argument)))
              ((= command-code ?x)
               (save-excursion
                 (find-file argument))))))
 
    (when (and term-ansi-at-host term-ansi-at-dir term-ansi-at-user)
      (setq buffer-file-name
            (format "%s@%s:%s" term-ansi-at-user term-ansi-at-host term-ansi-at-dir))
      (set-buffer-modified-p nil)
        (setq default-directory (if (string= term-ansi-at-host (system-name))
                                    (concatenate 'string term-ansi-at-dir "/")
                                  (format "/%s@%s:%s/" term-ansi-at-user term-ansi-at-host term-ansi-at-dir))))
    message)

(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (edit-server-start)))

