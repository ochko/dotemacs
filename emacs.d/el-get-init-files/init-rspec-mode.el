(add-hook 'rspec-mode-hook
          (lambda ()
            ;; runs rspec executable via bundler
            (setq rspec-use-rake-flag nil)
            (rspec-use-bundle t)
            (rspec-spec-command "rspec")))
