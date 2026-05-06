;;; init-6-git.el -- magit

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

(provide 'init-6-git)
;;; init-6-git.el ends here
