;;; --- Performance tuning -*- lexical-binding: t -*-

(use-package emacs
  :ensure nil
  :init
  ;; Larger read buffer for LSP responses (eglot/lsp-mode benefit)
  (setq read-process-output-max (* 1024 1024))   ; 1 MiB
  ;; Restore reasonable GC threshold after startup
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold (expt 2 26))))   ; 64 MiB
  ;; Speed up huge buffers by simplifying their setup
  (add-hook 'find-file-hook                      ; singular, modern name
            (lambda ()
              (when (> (buffer-size) (* 5 1024 1024))   ; > 5 MiB
                (buffer-disable-undo)
                (fundamental-mode)))))

;; These are not actually performance killers, but I can't find place to put it
(dolist (cmd '(scroll-left
               upcase-region
               narrow-to-region
               dired-find-alternate-file))
  (put cmd 'disabled nil))

(provide '05-perf)
