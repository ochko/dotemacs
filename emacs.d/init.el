;;; init.el --- entry point

;;(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require '01-package)
(require '02-my-functions)
(require '03-keys)
(require '04-files)
(require '05-perf)
(require '07-i18n)
(require '09-server)

(require '10-ui-builtin)
(require '12-ui-completion)
(require '14-ui-theme)
(require '23-nav-dir)
(require '24-nav-buff)

(require '40-coding-support)
(require '41-treesit)
(require '42-web)
(require '45-textual)
(require '45-ruby)
(require '45-others)

(require '52-magit)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ag auctex avy clipetty consult corfu ef-themes emmet-mode
        expand-region forge go-mode jinx kkp md-ts-mode orderless
        org-modern org-modern-indent reverse-im sass-mode scss-mode
        slim-mode solarized-theme terraform-mode treesit-auto vertico
        web-mode yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
