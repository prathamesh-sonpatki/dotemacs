(autoload 'ruby-mode "ruby-mode" nil t)

;; Custom file types to which Ruby mode is applied

(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Isolate\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'"   . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '(".irbrc" . ruby-mode))
(add-to-list 'auto-mode-alist '(".railsrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("Appraisals" . ruby-mode))

;; Ruby mode hook
(add-hook 'ruby-mode-hook '(lambda ()
                             (setq ruby-deep-arglist t)
                             (setq ruby-deep-indent-paren nil)
                             (setq c-tab-always-indent nil)
                             (require 'inf-ruby)
                             (require 'ruby-compilation)))
;; Add HashRocket

(defun insert-arrow ()
  (interactive)
  (delete-horizontal-space t)
  (insert " => "))

(define-key ruby-mode-map (kbd "C-.") 'insert-arrow)
;;(define-key rinari-minor-mode-map (kbd "C-.") 'insert-arrow)

;; inf-ruby
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; robe
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)


;; Bundler
(require 'bundler)

;; add rubocop - Ruby static code analyzer
(add-hook 'ruby-mode-hook 'rubocop-mode)

;;rbnenv
(require 'rbenv)
(global-rbenv-mode)

;;minitest
(add-hook 'ruby-mode-hook 'minitest-mode)
