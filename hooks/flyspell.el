(require 'flyspell)
(add-hook 'find-file-hooks 'turn-on-flyspell)
(setq ispell-program-name "/usr/local/bin/aspell")
