(require 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;; Custom keybindings for evaluating code
(define-key lua-mode-map (kbd "C-x C-e") 'lua-send-current-line)
(define-key lua-mode-map (kbd "C-x C-r") 'lua-send-region)
(define-key lua-mode-map (kbd "C-x C-x") 'lua-send-buffer)
