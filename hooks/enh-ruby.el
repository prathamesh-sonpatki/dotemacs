(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".irbrc" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".railsrc" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '(".god" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Appraisals" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)

(require 'cl) ; If you don't have it already

;; add rubocop - Ruby static code analyzer
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)

;; Ruby mode hook
(add-hook 'enh-ruby-mode-hook '(lambda ()
                             (setq ruby-deep-arglist t)
                             (setq ruby-deep-indent-paren nil)
                             (setq c-tab-always-indent nil)
                             (require 'inf-ruby)
                             (require 'ruby-compilation)))

;; inf-ruby
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; robe
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(global-robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))
(custom-set-variables
 '(robe-completing-read-func 'helm-robe-completing-read))
(require 'auto-complete)
(add-hook 'robe-mode-hook 'ac-robe-setup)


;; Bundler
(require 'bundler)

;; add rubocop - Ruby static code analyzer
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)

;;rbnenv
(require 'rbenv)
(global-rbenv-mode)

;; Avoid conflicts with rspec-mode
(add-hook 'minitest-mode-hook (lambda () (rspec-verifiable-mode -1)))

;; Minitest

(add-hook 'enh-ruby-mode-hook 'minitest-mode)

;; Don't add magic comment about coding: utf8
(setq ruby-insert-encoding-magic-comment nil)
(setq enh-ruby-add-encoding-comment-on-save nil)

(eval-after-load 'minitest
  '(minitest-install-snippets))

;; Mutant
(require 'mutant)
(add-hook 'ruby-mode-hook 'mutant-mode)
(add-hook 'dired-mode-hook 'mutant-dired-mode)
