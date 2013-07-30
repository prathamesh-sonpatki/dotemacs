;; RHTML

(add-to-list 'load-path "~/.emacs.d/elpa/rhtml")
(require 'rhtml-mode)

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map
                             (kbd "M-s") 'save-buffer))))
