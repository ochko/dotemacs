(add-hook 'terraform-mode-hook (lambda ()
                                 (lsp-deferred)
                                 (terraform-format-on-save-mode)
                                 (setq lsp-disabled-clients '(tfls))
                                 ;;(setq-local lsp-enable-file-watchers nil)
                                 ))

;; tfmls causes too many open files error when lsp-enable-file-watchers is true
(dir-locals-set-class-variables 'infra '((terraform-mode . ((lsp-enable-file-watchers . nil)))))
(dir-locals-set-directory-class "~/projects/cloud-infra/" 'infra)
