;;; General coding/programming support

;; copy/paste fro-to OS clipboard through tty signalling
(use-package clipetty
  :hook (after-init . global-clipetty-mode))

;; increase selected region by semantic units
(use-package expand-region
  :bind ("M-=" . er/expand-region))

;; in-buffer completion with a popup
(use-package corfu
  :init (global-corfu-mode)
  :custom (corfu-auto t))

;; Ruby: install ruby-lsp gem for each rbenv. It works without adding it to Gemfiles
;; Terraform: install terraform-ls from homebrew tap or official Hashicorp website
;; Go: install from https://go.dev/gopls/#installation
(use-package eglot
  :ensure nil  ; built-in on Emacs 29+
  :hook ((ruby-mode ruby-ts-mode) . eglot-ensure)
  :hook ((go-mode go-ts-mode) . eglot-ensure)
  :hook (terraform-mode . eglot-ensure)
  :custom
  (eglot-workspace-configuration
   '(:gopls (:hoverKind "FullDocumentation"         ; https://go.dev/gopls/settings
             :usePlaceholders t)
     :terraform-ls (:ignoreSingleFileWarning t)))
  :config
  (add-to-list 'eglot-server-programs
               '((ruby-mode ruby-ts-mode) . ("ruby-lsp"))
               '(terraform-mode . ("terraform-ls" "serve"))))

;; Auto install tree-sitter detected languages: lua, ruby, bash, etc.
;; Many built-in language modes like lua-ts-mode requires tree-sitter grammars.
(use-package treesit-auto
  :custom (treesit-auto-install 'prompt)
  :config (global-treesit-auto-mode))

;; Delete trailing white-spaces only in programming modes
;; because in Markdown, Org, text-mode etc has meaningful trailing white-spaces.
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'delete-trailing-whitespace nil t)))

(provide '40-coding-support)
