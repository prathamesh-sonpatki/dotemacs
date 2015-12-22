(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key mode-specific-map [?a] 'org-agenda)

(setq org-log-done 'time)
(setq org-log-done 'note)
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

(setq org-todo-keywords
           '((sequence "TODO(t)" "IN PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)" "DELEGATED(g)")
             (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
             (sequence "|" "CANCELED(c)")))

;; Persist org timer across emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Ask for a note when timer is stopped
(setq org-log-note-clock-out t)

;; Set sorting strategy
(setq org-agenda-sorting-strategy
      (quote
       ((agenda priority-down time-up tag-up category-keep effort-up)
        (todo priority-down user-defined-up todo-state-up effort-up)
        (tags user-defined-up)
        (search category-keep))))

(provide 'pps-org)
