(require 'hideif)
(setq hide-ifdef-initially t)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (setq hide-ifdef-shadow t)
	    (setq hide-ifdef-mode t)
	    (hide-ifdefs)
	    ))

(load-file "/home/dyc/.emacs.d/hideif-erlang.el")

(require 'xcscope)
(define-key global-map [( f3)] 'cscope-prev-symbol)
(define-key global-map [( f4)]  'cscope-next-symbol)
(define-key global-map [( f5)]  'cscope-find-this-symbol)
(define-key global-map [( f6)]  'cscope-find-global-definition)
(define-key global-map [( f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [( f8)]  'cscope-pop-mark)


(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)

;(load "linum.el")
(require 'linum)   
(global-linum-mode 1)
