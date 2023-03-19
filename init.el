;;; package --- Summary

;;; Commentary:

;;; Code:

;; Setup straight.el https://github.com/radian-software/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

(setq package-enable-at-startup nil)

;;; Workaround to fix SSL issue while downloading packages
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; initialize cask

(require 'cask "~/.cask/cask.el")

(cask-initialize)

;; Fix load path
;; (require 'exec-path-from-shell)
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))
;; (exec-path-from-shell-copy-env "GPG_TTY")
;; (exec-path-from-shell-copy-env "GIT_MERGE_AUTOEDIT")
;; (exec-path-from-shell-copy-env "BUNDLER_EDITOR")
;; (exec-path-from-shell-copy-env "ANDROID_HOME")

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq inhibit-splash-screen t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; set paths
(defvar root-dir "~/.emacs.d")
(defvar configs-dir (concat root-dir "/configs"))
(defvar pkgs-dir (concat root-dir "/pkgs"))
(defvar hooks-dir (concat root-dir "/hooks"))
(defvar logs-dir (concat root-dir "/logs"))

;; GitHub Copilot setup
(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)

(add-hook 'prog-mode-hook 'copilot-mode)

(with-eval-after-load 'company
  ;; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends))

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)

;; load configs
(add-to-list 'load-path configs-dir)

(require 'pps-multi-term)
(require 'pps-settings)
(require 'pps-keybindings)
(require 'pps-org)

;; load the packages
(mapcar 'load (directory-files pkgs-dir t "\\.el\\'"))

;; load the hooks
(mapcar 'load (directory-files hooks-dir t "\\.el\\'"))

;; Enable Flycheck mode
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Font
(set-face-attribute 'default nil
                    :font "Iosevka Curly"
                    :height 200
                    )

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))

(load-library "hideshow")
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'enh-ruby-mode-hook         'hs-minor-mode)
(put 'dired-find-alternate-file 'disabled nil)

(setq backup-directory-alist `(("." . "~/.saves")))

(setq-default show-trailing-whitespace t)

(setq large-file-warning-threshold 50000)

(defun right-region (from to)
  "Right-justify each nonblank line starting in the region."
  (interactive "r")
  (if (> from to)
      (let ((tem to))
        (setq to from from tem)))
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (while (not (eobp))
        (or (save-excursion (skip-chars-forward " \t") (eolp))
            ;;    (center-line))              ; this was the original code
            (justify-current-line 'right)) ; this is the new code
        (forward-line 1)))))
;; (desktop-save-mode 1)

(eval-after-load "sql"
  '(load-library "sql-indent"))

(defun file-notify-rm-all-watches ()
  "Remove all existing file notification watches from Emacs."
  (interactive)
  (maphash
   (lambda (key _value)
     (file-notify-rm-watch key))
   file-notify-descriptors))

;;; init.el ends here
