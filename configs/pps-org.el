(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key mode-specific-map [?a] 'org-agenda)

(setq org-log-done 'time)
(setq org-deadline-warning-days 2)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


(setq org-default-notes-file (concat org-directory "~/Notes/notes.org"))
  (define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Notes/todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Notes/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")
        ("l" "Learning" entry (file+datetree "~/Notes/learning.org")
             "* TODO %?\n  %i\n  %a")))

(define-key global-map "\C-ct"
        (lambda () (interactive) (org-capture nil "t")))

(define-key global-map "\C-cj"
        (lambda () (interactive) (org-capture nil "j")))

(define-key global-map "\C-cl"
        (lambda () (interactive) (org-capture nil "l")))

(setq org-agenda-include-diary t)

(setq org-todo-keywords
           '((sequence "TODO(t)" "|" "DONE(d)")
             (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
             (sequence "|" "CANCELED(c)")))

(setq org-clock-persist 'history)

(org-clock-persistence-insinuate)

(provide 'pps-org)
