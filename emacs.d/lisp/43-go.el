;;; Go -*- lexical-binding: t -*-

(defun my/go-mode-eglot-hooks ()
  "Per-buffer setup: format and organize imports on save via eglot."
  (add-hook 'before-save-hook #'eglot-format-buffer nil t)
  (add-hook 'before-save-hook
            (lambda ()
              (call-interactively #'eglot-code-action-organize-imports))
            nil t))
(use-package go-ts-mode
  :ensure nil
  :mode "\\.go\\'"
  :hook (go-ts-mode . my/go-mode-eglot-hooks)
  :custom (go-ts-mode-indent-offset 4))

;; Go.mod files
(use-package go-mod-ts-mode
  :ensure nil
  :mode "/go\\.mod\\'")
(use-package go-work-ts-mode
  :ensure nil
  :mode "go\\.work\\'")

(provide '43-go)
