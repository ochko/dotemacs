(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)
(setq js2-mirror-mode nil)

(add-hook 'js2-mode-hook
          (lambda ()
            (autopair-mode)
            ;; flycheck disabled due to slowness(is it really slow?)
            ;; (flycheck-mode t)
            (local-set-key (kbd "RET") 'newline-and-indent)
            (js2-imenu-extras-mode)
            (imenu-add-menubar-index)))
