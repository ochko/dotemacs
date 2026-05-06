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
(require '42-web)
(require '45-textual)
(require '45-ruby)
(require '45-others)

(require '52-magit)

;;; init.el ends here
