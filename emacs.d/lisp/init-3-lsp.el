;;; init-3-lsp.el --- auto completion

;;; Install ruby-lsp gem for each rbenv versions.
;;; It works without adding it to Gemfile.

(use-package corfu
  :init (global-corfu-mode)
  :custom (corfu-auto t))

(use-package eglot
  :ensure nil  ; built-in on Emacs 29+
  :hook ((ruby-mode ruby-ts-mode) . eglot-ensure)
  :hook ((go-mode go-ts-mode) . eglot-ensure)
  :hook (terraform-mode . eglot-ensure)
  :custom
  (eglot-workspace-configuration
   '(:gopls (:hoverKind "FullDocumentation"
             :usePlaceholders t)                           ; https://go.dev/gopls/settings
     :terraform-ls (:ignoreSingleFileWarning t)))
  :config
  (add-to-list 'eglot-server-programs
               '((ruby-mode ruby-ts-mode) . ("ruby-lsp"))
               '(terraform-mode . ("terraform-ls" "serve"))))

(provide 'init-3-lsp)
;;; init-3-lsp.el ends here
