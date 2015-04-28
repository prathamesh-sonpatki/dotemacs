;; initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(package-initialize)
;; Fix load path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; set paths
(setq load-path (cons "~/.emacs.d" load-path))
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
