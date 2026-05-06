(add-hook 'after-init-hook 'global-company-mode)
;; (global-set-key (kbd "M-TAB") 'company-complete-common)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
