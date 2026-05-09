;;; IaC -*- lexical-binding: t -*-

(use-package terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode)
  :custom
  (terraform-indent-level 2))

(use-package dockerfile-ts-mode
  :ensure nil   ; built-in
  :mode "[/\\]\\(?:Containerfile\\|Dockerfile\\)\\(?:\\.[^/\\]*\\)?\\'")

(use-package bash-ts-mode
  :ensure nil
  :mode "\\.bash\\'")

(use-package zsh-ts-mode
  :ensure nil
  :mode "\\.sh\\'")

(use-package lua-ts-mode
  :mode "\\.lua\\'"
  :custom
  (lua-ts-indent-offset 2))

(provide '41-infra)
