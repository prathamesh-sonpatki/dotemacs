(require 'auto-package)

(defvar my-packages '(melpa

                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      textmate

                      ;; theme
                      molokai-theme

                      ;; clojure
                      clojure-mode
                      clojure-test-mode
                      clojurescript-mode
                      nrepl
                      ac-nrepl

                      ;; ruby
                      rinari
                      rspec-mode

                      ;; js
                      js2-mode
                      coffee-mode

                      ;; markup
                      haml-mode
                      less-css-mode
                      sass-mode
                      scss-mode
                      markdown-mode

                      ;; flymake
                      flymake-shell
                      flymake-ruby
                      flymake-haml
                      flymake-css

                      ;; navigation
                      ack-and-a-half
                      ascope

                      ;; editing
                      auto-complete
                      smooth-scrolling
                      browse-kill-ring
                      undo-tree
                      yasnippet

                      ;; utils
                      magit
                      melpa
                      todochiku
                      multiple-cursors
                      paredit
                      multi-term
                      rings
                      rcirc
                      smartparens
                      shell
                      powerline
                      )
  "A list of packages to ensure are installed at launch.")

(auto-package-install my-packages)

(provide 'pps-packages)
