;;; File and persistence behavior -*- lexical-binding: t -*-

(use-package files
  :ensure nil
  :custom
  (make-backup-files nil)
  (auto-save-default nil)
  (auto-save-list-file-name nil)
  (enable-local-variables :safe))

;; Using magit, but we need it to project.el work properly. Enabling only Git
(use-package vc
  :ensure nil
  :custom (vc-handled-backends '(Git)))

(use-package tramp
  :ensure nil
  :custom (tramp-default-method "ssh"))

;; ‘C-x r m’ – set
;; ‘C-x r b’ – jump
;; ‘C-x r l’ – list
;; ‘M-x bookmark-delete’ – delete
(use-package bookmark
  :ensure nil
  :custom
  (bookmark-default-file
   (expand-file-name ".bookmark" user-emacs-directory)))

(provide '04-files)
