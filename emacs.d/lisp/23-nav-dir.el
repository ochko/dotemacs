;;; Navigating between files, directories, and projects

;; dired
(when-let ((gls (executable-find "gls")))
     (setq insert-directory-program gls))

(use-package dired
  :ensure nil
  :bind (("M-'" . dired-jump)
         (:map my-fn-map
               ("'" . dired-jump)))
  :custom
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-listing-switches "-aBhlt --group-directories-first") ; -t time sort
  (dired-dwim-target t)                          ; default to other pane's dir for copy/move
  :hook (dired-mode . dired-hide-details-mode))  ; less visual noise

(use-package project
  :ensure nil
  :bind (:map my-fn-map
              ("o" . project-find-file)
              ("/" . project-query-replace-regexp))
  :custom
  (project-switch-commands 'project-find-file))

;; search with ag
(use-package ag
  :custom
  (ag-reuse-buffers nil)
  ;; (ag-highlight-search t)
  ;; (ag-reuse-buffers t)
  :bind (("C-c g" . ag-project)
         (:map my-fn-map
               ("-" . ag-project))))

(provide '23-nav-dir)
