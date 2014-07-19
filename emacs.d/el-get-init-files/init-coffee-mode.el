(add-hook 'coffee-mode-hook
          (lambda ()
            ;; two spaces for tab
            (make-local-variable 'tab-width)
            (set 'tab-width 2)
            ;; If you don't want your compiled files to be wrapped
            (setq coffee-args-compile '("-c" "--bare"))
            ;; *Messages* spam
            (setq coffee-debug-mode t)
            ;; key binding
            (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
            ;; Compile '.coffee' files on every save
            (and (file-exists-p (buffer-file-name))
                 (file-exists-p (coffee-compiled-file-name))
                 (coffee-cos-mode t))))
