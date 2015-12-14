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
(setq root-dir "~/.emacs.d")
(setq configs-dir (concat root-dir "/configs"))
(setq pkgs-dir (concat root-dir "/pkgs"))
(setq hooks-dir (concat root-dir "/hooks"))
(setq logs-dir (concat root-dir "/logs"))

;; load configs
(add-to-list 'load-path configs-dir)

(require 'pps-rcirc)
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
                    :font "Source Code Pro Medium"
                    :height 240
                    :weight 'normal)
