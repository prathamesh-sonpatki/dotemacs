;;; package --- Summary

;;; Commentary:

;;; Code:

;; initialize cask
(require 'cask "~/.cask/cask.el")

(cask-initialize)
(package-initialize)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq inhibit-splash-screen t)

;; Fix load path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; set paths
(defvar root-dir "~/.emacs.d")
(defvar configs-dir (concat root-dir "/configs"))
(defvar pkgs-dir (concat root-dir "/pkgs"))
(defvar hooks-dir (concat root-dir "/hooks"))
(defvar logs-dir (concat root-dir "/logs"))

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
                    :font "Source Code Pro"
                    :height 200
                    :weight 'regular)

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
;;; init.el ends here
