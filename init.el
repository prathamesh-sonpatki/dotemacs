(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; set paths
(setq load-path (cons "~/.emacs.d" load-path))
(setq root-dir "~/.emacs.d")
(setq configs-dir (concat root-dir "/configs"))
(setq hooks-dir (concat root-dir "/hooks"))
(setq logs-dir (concat root-dir "/logs"))

;; load configs
(add-to-list 'load-path configs-dir)

(require 'pps-rcirc)
(require 'pps-multi-term)
(require 'pps-settings)
(require 'pps-keybindings)

;; load the hooks
(mapcar 'load (directory-files hooks-dir t "\\.el\\'"))
