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

;; Ruby mode hook
(add-hook 'ruby-mode-hook '(lambda ()
                             (setq ruby-deep-arglist t)
                             (setq ruby-deep-indent-paren nil)
                             (setq c-tab-always-indent nil)
                             (require 'inf-ruby)
                             (require 'ruby-compilation)))

;; Activate rvm

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))


;; Add HashRocket

(defun insert-arrow ()
  (interactive)
  (delete-horizontal-space t)
  (insert " => "))

(define-key ruby-mode-map (kbd "C-.") 'insert-arrow)
;;(define-key rinari-minor-mode-map (kbd "C-.") 'insert-arrow)
