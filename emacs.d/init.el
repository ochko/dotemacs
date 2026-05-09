;;; init.el --- entry point -*- lexical-binding: t -*-

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

(require '31-git)
(require '33-prog)
(require '35-treesit)

(require '41-infra)
(require '42-ruby)
(require '43-go)
(require '48-web)

(require '52-edit)
(require '54-tex)

;;; init.el ends here
