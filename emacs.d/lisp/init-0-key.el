(use-package kkp
  :ensure t
  :hook (tty-setup . global-kkp-mode))

(use-package which-key
  :ensure nil
  :init (which-key-mode))

(define-prefix-command 'my-fn-map)
(global-set-key (kbd "<f3>") 'my-fn-map)

(provide 'init-0-key)
