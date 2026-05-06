;;; init-2-misc.el -- built-in configs

;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)
;; Lower threshold back to 64 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 26))))

;; Some of the language server responses are in 800k - 3M range
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; disable backup/autosave files
(setq make-backup-files nil
      auto-save-default nil
      auto-save-list-file-name nil)
;; Or store them in system's temp directory
;; (setq backup-directory-alist `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; disable version control backends(cvs, svn, bzr, hg git etc..)
(setq-default vc-handled-backends nil)

;; only allow safe file variables and ignore the rest
(setq enable-local-variables :safe)

;; case-insensitive search
(setq case-fold-search t)

 ;; default language and input method is unicode
(setq current-language-environment "UTF-8"
      default-input-method "rfc1345")

;; tramp over ssh
(setq tramp-default-method "ssh")

;; save bookmarks in emacs' directory insteaf user's home
(setq bookmark-default-file (expand-file-name ".bookmark" user-emacs-directory))
;; ‘C-x r m’ – set
;; ‘C-x r b’ – jump
;; ‘C-x r l’ – list
;; ‘M-x bookmark-delete’ – delete

;; shorter query answer
(defalias 'yes-or-no-p 'y-or-n-p)

;; set some symbols' properties
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init-2-misc)
;;; init-2-misc.el ends here
