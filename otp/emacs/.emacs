(require 'hideif)
(setq hide-ifdef-initially t)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (setq hide-ifdef-shadow t)
	    (setq hide-ifdef-mode t)
	    (hide-ifdefs)
	    ))

(load-file "/home/dyc/.emacs.d/hideif-erlang.el")
