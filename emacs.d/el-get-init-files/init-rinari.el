(add-to-list 'auto-mode-alist
             '("\\.\\(rb\\|rake\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\|Guardfile\\|Rakefile\\)\\'" . ruby-mode))

;; bind key if rspec-mode is available
(when (require 'rspec-mode nil 'noerror)
  (add-hook 'ruby-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c f r") 'rspec-find-spec-or-target-other-window)
              (local-set-key (kbd "RET") 'newline-and-indent))))
