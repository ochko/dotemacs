;;; init.el --- entry point

;;(setq debug-on-error t)

;; Customize persists to a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

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

(require '40-prog)
(require '41-treesit)
(require '42-web)
(require '43-tex)
(require '45-edit)
(require '46-ruby)
(require '47-others)

(require '52-magit)

;;; init.el ends here
