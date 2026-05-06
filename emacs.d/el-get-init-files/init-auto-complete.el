(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-start nil
      ac-candidate-limit 20)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dictionaries")
(add-to-list 'ac-user-dictionary-files "~/.emacs.d/ac-dictionary")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(add-to-list 'ac-modes 'terraform-mode)
