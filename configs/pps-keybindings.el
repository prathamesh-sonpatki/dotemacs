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
(global-set-key (kbd "<f1>") 'toggle-frame-fullscreen)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Multiple cursors

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Magit Rules
;;(global-set-key (kbd "C-x g") 'magit-status)

(provide 'pps-keybindings)
