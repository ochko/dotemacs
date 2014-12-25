(add-hook 'rspec-mode-hook
          (lambda ()
            ;; prevent prompt about rspec command getting set in .dir-locals.el
            (put 'rspec-spec-command 'safe-local-variable #'stringp)
            ;; runs rspec executable via bundler
            (setq rspec-use-rake-when-possible nil)
            (setq rspec-use-bundler-when-possible t)))
