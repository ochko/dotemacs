;;; magit

(use-package git-commit-ts-mode
  :ensure nil
  :mode "\\COMMIT_EDITMSG\\'")

(use-package magit
  :bind (("M-s" . magit-status)
         ("M-g s" . magit-status)
         (:map my-fn-map
               ("g" . magit-blame)))
  :custom
  (magit-git-executable "/opt/homebrew/bin/git")
  (magit-push-current-set-remote-if-missing t)
  :config
  (magit-auto-revert-mode -1))

(use-package forge
  :after magit)

(provide '52-magit)
