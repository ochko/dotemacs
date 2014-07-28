;; el-get (https://github.com/dimitri/el-get)
;; Paste this into *scratch* buffer, hit C-j, and you have a working el-get.
;;
;; (url-retrieve
;;  "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;;  (lambda (s)
;;    (goto-char (point-max))
;;    (eval-print-last-sexp)))

(let ((el-get-install-dir (emacs-user-dir-concat "el-get/el-get"))
      (el-get-user-recipes (emacs-user-dir-concat "el-get-recipes"))
      (el-get-user-inits (emacs-user-dir-concat "el-get-init-files"))
      (el-get-user-packages
       '(
         ag
         ace-jump-mode
         smart-tab
         auto-complete
         smex
         expand-region
         multiple-cursors
         visual-regexp-steroids
         guide-key
         key-chord
         space-chord
         idomenu
         flx
         ido-vertical-mode
         paredit
         autopair
         anything
         thingatpt+
         magit
         projectile
         rbenv
         pbcopy
         mo-git-blame
         yasnippet
         flycheck
         js2-mode
         js2-refactor
         yeoman-backbone
         rspec-mode
         rinari
         ember-mode
         org-mode
         deft
         coffee-mode
         yaml-mode
         haml-mode
         slim-mode
         markdown-mode
         php-mode
         actionscript-mode
         feature-mode
         dired-details+
         color-theme-solarized
         mac-app-binding
         )))
  (when (file-directory-p el-get-install-dir)
    (add-to-list 'load-path el-get-install-dir)
    (require 'el-get)
    (add-to-list 'el-get-recipe-path el-get-user-recipes)
    (setq el-get-user-package-directory el-get-user-inits)
    (el-get 'sync el-get-user-packages)))

(provide 'el-get-initializer)
