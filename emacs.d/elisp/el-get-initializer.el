;; el-get (https://github.com/dimitri/el-get)
;; Paste this into *scratch* buffer, hit C-j, and you have a working el-get.
;;
;; (url-retrieve
;;  "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el"
;;  (lambda (s)
;;    (goto-char (point-max))
;;    (eval-print-last-sexp)))
;;
;; Could not create connection to raw.github.com:443
;; Evaluate:
;; (el-get-invalidate-autoloads)

(let ((el-get-install-dir (emacs-user-dir-concat "el-get/el-get"))
      (el-get-user-recipes (emacs-user-dir-concat "el-get-recipes"))
      (el-get-user-inits (emacs-user-dir-concat "el-get-init-files"))
      (el-get-user-packages
       '(ace-jump-mode
         ;;actionscript-mode
         ag
         auto-complete
         ;;coffee-mode
         color-theme
         solarized-emacs
         ;;deft
         ;;dired-details+
         dumb-jump
         ;;emacs-dirtree
         ;;ensime
         expand-region
         ;;feature-mode
         flx
         flycheck
         lsp-mode
         lsp-ui
         company-mode
         company-lsp
         ;;groovy-emacs-mode
         guide-key
         ;;haml-mode
         ;;helm
         ido-vertical-mode
         idomenu
         web-mode
         ;;js2-mode
         ;;js2-refactor
         tide
         key-chord
         ;;langtool
         mac-app-binding
         with-editor
         forge
         magit
         transient
         mo-git-blame
         ;;multi-term
         ;;multiple-cursors
         ;;nodejs-repl
         org-mode
         paredit
         pbcopypaste
         ;;php-mode
         projectile
         projectile-rails
         rubocop
         rbenv
         ;;rinari
         rspec-mode
         sass-mode
         slim-mode
         markdown-mode
         smart-tab
         smex
         thingatpt+
         ;;visual-regexp-steroids
         ;;writegood-mode
         ;;synonyms
         ;;synosaurus
         popup
         yaml-mode
         yasnippet
         ;;; Erlang/Elixir
         ;;erlang-mode
         ;;elixir
         ;;alchemist
         go-mode
         go-projectile
         ;;; dart/flutter
         ;;eglot
         lsp-dart
         dart-mode
         ;;hover
         )))

  (add-to-list 'load-path el-get-install-dir)

  (unless (require 'el-get nil 'noerror)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
        (goto-char (point-max))
        (eval-print-last-sexp)))

  (when (file-directory-p el-get-install-dir)

    (add-to-list 'el-get-recipe-path el-get-user-recipes)

    (setq el-get-user-package-directory el-get-user-inits)

    (el-get 'sync el-get-user-packages)))

(provide 'el-get-initializer)
