;; Activate rvm

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
