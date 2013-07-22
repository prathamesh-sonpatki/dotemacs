(require 'package) ; required for emacs23

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(defun auto-package-init ()
  (message "Running package-initialize...")
  (package-initialize)
  (when (not package-archive-contents)
    (message "Running package-refresh-contents...")
    (package-refresh-contents)))

(defun auto-package-install (my-packages)
  (auto-package-init)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'auto-package)
