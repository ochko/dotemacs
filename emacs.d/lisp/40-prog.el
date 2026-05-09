;;; General coding/programming support

;; copy/paste fro-to OS clipboard through tty signalling
(use-package clipetty
  :diminish     ; hide modeline
  :hook (after-init . global-clipetty-mode))

;; increase selected region by semantic units
(use-package expand-region
  :bind ("M-=" . er/expand-region))

;; in-buffer completion with a popup
(use-package corfu
  :init (global-corfu-mode)
  :custom (corfu-auto t))

(use-package eldoc
  :ensure nil
  :diminish  ; hide modeline status
  :init
  ;; don't auto-enable everywhere
  (global-eldoc-mode -1)
  :bind ("C-c d" . eldoc-doc-buffer)
  :config
  ;; Even when eldoc-mode is on, never write to the echo area
  (remove-hook 'eldoc-display-functions 'eldoc-display-in-echo-area))

;; eldoc buffer opens in a 40%-wide side window on the right
(add-to-list 'display-buffer-alist
             '("\\*eldoc\\*"
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (side . right)
               (window-width . 0.4)))

;; Ruby: gem install ruby-lsp ruby-lsp-rails rubocop
;;      or (standard ruby-lsp-standard) or (rubyfmt ruby-lsp-rubyfmt) instead of rubocop
;;
;; Terraform: install terraform-ls from homebrew tap or official Hashicorp website
;;
;; Go: install from https://go.dev/gopls/#installation
;;
(use-package eglot
  :ensure nil  ; built-in on Emacs 29+
  :hook ((ruby-mode ruby-ts-mode) . eglot-ensure)
  :hook ((go-mode go-ts-mode) . eglot-ensure)
  :hook (terraform-mode . eglot-ensure)
  :hook (eglot-managed-mode . flymake-mode)
  :custom
  (eglot-workspace-configuration
   ;; https://go.dev/gopls/settings
   '(:gopls (:hoverKind "FullDocumentation"
             :usePlaceholders t)
     :terraform-ls (:ignoreSingleFileWarning t)))
  :config
  (dolist (entry
           '(((ruby-mode ruby-ts-mode)
              . ("ruby-lsp"
                 :initializationOptions
                 (:enabledFeatures (:codeActions t
                                    :diagnostics t
                                    :formatting t
                                    :documentSymbols t
                                    :foldingRanges t
                                    :selectionRanges t
                                    :semanticHighlighting t
                                    :completion t
                                    :hover t
                                    :inlayHint t
                                    :onTypeFormatting t
                                    :signatureHelp t)
                  :formatter "auto"
                  :linters ["rubocop"])))
             (terraform-mode . ("terraform-ls" "serve"))))
    (add-to-list 'eglot-server-programs entry)))

(use-package flymake
  :custom
  ;; Replaces " Flymake" with " FM"
  (flymake-mode-line-lighter " ⁉"))


;; Delete trailing white-spaces only in programming modes
;; because in Markdown, Org, text-mode etc has meaningful trailing white-spaces.
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'delete-trailing-whitespace nil t)))

(provide '40-prog)
