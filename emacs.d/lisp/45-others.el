;; Go
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


(use-package terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode)
  :custom
  (terraform-indent-level 2))

(use-package lua-ts-mode
  :mode "\\.lua\\'"
  :custom
  (lua-ts-indent-offset 2))

(use-package dockerfile-ts-mode
  :ensure nil   ; built-in
  :mode "[/\\]\\(?:Containerfile\\|Dockerfile\\)\\(?:\\.[^/\\]*\\)?\\'")

(use-package yaml-ts-mode
  :ensure nil
  :mode ("\\.ya?ml\\'")
  :custom (yaml-indent-offset 2))

;; Bash
(use-package bash-ts-mode
  :ensure nil
  :mode "\\.bash\\'")
;; Zsh
(use-package zsh-ts-mode
  :ensure nil
  :mode "\\.sh\\'")

(use-package git-commit-ts-mode
  :ensure nil
  :mode "\\COMMIT_EDITMSG\\'")

(provide '45-others)
