(use-package go-mode
  :hook (go-mode . my/go-mode-eglot-hooks)
  :preface
  (defun my/go-mode-eglot-hooks ()
    "Per-buffer setup: format and organize imports on save via eglot."
    (add-hook 'before-save-hook #'eglot-format-buffer nil t)
    (add-hook 'before-save-hook
              (lambda ()
                (call-interactively #'eglot-code-action-organize-imports))
              nil t)))

(use-package terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode)
  :custom
  (terraform-indent-level 2))

(use-package lua-ts-mode
  :ensure nil   ; built-in
  :mode "\\.lua\\'"
  :custom
  (lua-ts-indent-offset 2))

(use-package tramp
  :ensure nil
  :custom (tramp-default-method "ssh"))

(provide '45-others)
