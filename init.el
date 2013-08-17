;; set paths
(setq load-path (cons "~/.emacs.d" load-path))
(setq root-dir "~/.emacs.d")
(setq configs-dir (concat root-dir "/configs"))
(setq hooks-dir (concat root-dir "/hooks"))
(setq logs-dir (concat root-dir "/logs"))

;; load configs
(add-to-list 'load-path configs-dir)
(require 'pps-packages)
(require 'pps-rcirc)
(require 'pps-multi-term)
(require 'pps-settings)
(require 'pps-keybindings)

;; load the hooks
(mapcar 'load (directory-files hooks-dir t "\\.el\\'"))
