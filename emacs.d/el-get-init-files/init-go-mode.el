(add-hook 'go-mode-hook
          (lambda ()
            (lsp)
            (setq lsp-go-hover-kind "FullDocumentation")
            (add-hook 'before-save-hook #'lsp-format-buffer t t)
            (add-hook 'before-save-hook #'lsp-organize-imports t t)
            ))
