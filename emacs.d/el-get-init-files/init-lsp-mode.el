(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]tmp\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]log\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]public\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]storage\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]db\\'")
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-lens-enable nil
        lsp-idle-delay 0.500
        lsp-log-io nil
        lsp-use-plists t
        lsp-eldoc-enable-hover nil
        lsp-modeline-code-actions-enable nil
        lsp-modeline-diagnostics-enable nil
        lsp-go-use-gofumpt t
        lsp-solargraph-multi-root nil
        lsp-solargraph-use-bundler nil
        lsp-diagnostics-provider :none
        lsp-warn-no-matched-clients nil
        lsp-signature-auto-activate nil
        lsp-signature-render-documentation nil
        lsp-enable-snippet nil
        lsp-ui-doc-enable nil
        lsp-ui-doc-show-with-cursor nil
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-flycheck-enable nil
        lsp-ui-imenu-enable t
        lsp-ui-peek-enable t
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-delay 0.5
        lsp-ui-sideline-diagnostic-max-line-length 80
        lsp-ui-sideline-diagnostic-max-lines 5
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-sideline-show-symbol nil
        lsp-ui-sideline-update-mode 'line
        )
  )
