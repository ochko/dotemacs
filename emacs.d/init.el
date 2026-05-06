;;; init.el --- entry point

;;(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-0-package)
(require 'init-0-key)
(require 'init-1-ui)
(require 'init-2-misc)
(require 'init-3-lsp)
(require 'init-4-comp)
(require 'init-6-git)
(require 'init-7-theme)


;;; init.el ends here

(use-package clipetty
  :hook (after-init . global-clipetty-mode))

;; Two more keys bindings avalaible after enabling kkp
;; (global-set-key (kbd "C-,") '....)
;; (global-set-key (kbd "C-.") '....)

(define-key my-fn-map (kbd "v") 'find-file)
(define-key my-fn-map (kbd "s") 'save-buffer)
(define-key my-fn-map (kbd "k") 'kill-current-buffer)
(define-key my-fn-map (kbd "i") 'indent-region)
;; movement
(define-key my-fn-map (kbd "n") 'next-error)
(define-key my-fn-map (kbd "<right>") 'next-match)
(define-key my-fn-map (kbd "p") 'previous-error)
(define-key my-fn-map (kbd "<left>") 'previous-error)
(define-key my-fn-map (kbd "<down>") 'end-of-buffer)
(define-key my-fn-map (kbd "<up>") 'beginning-of-buffer)
(define-key my-fn-map (kbd "a") 'beginning-of-defun)
(define-key my-fn-map (kbd "e") 'end-of-defun)
(define-key my-fn-map (kbd "f") 'forward-sexp)
(define-key my-fn-map (kbd "b") 'backward-sexp)
;; marking and yanking
(define-key my-fn-map (kbd "m") 'mark-sexp)
(define-key my-fn-map (kbd "h") 'mark-defun)
(define-key my-fn-map (kbd "y") "\M-m\C- \C-e\M-w\M-m")
;; save frame and restore
(define-key my-fn-map (kbd "^") "\C-xrw6")
(define-key my-fn-map (kbd "6") "\C-xrj6")

(define-key my-fn-map (kbd "&") "\C-xrw7")
(define-key my-fn-map (kbd "7") "\C-xrj7")

(define-key my-fn-map (kbd "*") "\C-xrw8")
(define-key my-fn-map (kbd "8") "\C-xrj8")

(define-key my-fn-map (kbd "(") "\C-xrw9")
(define-key my-fn-map (kbd "9") "\C-xrj9")

(define-key my-fn-map (kbd ")") "\C-xrw0")
(define-key my-fn-map (kbd "0") "\C-xrj0")

;; bookmark set and jumps
(define-key my-fn-map (kbd "!") "\C-xrm1\C-m")
(define-key my-fn-map (kbd "1") "\C-xrb1\C-m")

(define-key my-fn-map (kbd "@") "\C-xrm2\C-m")
(define-key my-fn-map (kbd "2") "\C-xrb2\C-m")

(define-key my-fn-map (kbd "#") "\C-xrm3\C-m")
(define-key my-fn-map (kbd "3") "\C-xrb3\C-m")

(define-key my-fn-map (kbd "$") "\C-xrm4\C-m")
(define-key my-fn-map (kbd "4") "\C-xrb4\C-m")

(define-key my-fn-map (kbd "%") "\C-xrm5\C-m")
(define-key my-fn-map (kbd "5") "\C-xrb5\C-m")


(use-package avy
  :bind (("C-;" . avy-goto-char-timer)
         (:map my-fn-map
               ("l" . avy-goto-line)
               ("j" . avy-goto-word-1)
               ("c" . avy-goto-char-2)
               ("SPC" . avy-pop-mark)))
  :custom
  (avy-background nil)
  (avy-all-windows nil))

(use-package ag
  :custom
  (ag-reuse-buffers nil)
  ;; (ag-highlight-search t)
  ;; (ag-reuse-buffers t)
  :bind (("C-c g" . ag-project)
         (:map my-fn-map
               ("-" . ag-project))))


;; make buffer names unique
(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'reverse))

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

(use-package expand-region
  :bind ("M-=" . er/expand-region))

(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . visual-line-mode)
         (LaTeX-mode . flyspell-mode)
         (LaTeX-mode . LaTeX-math-mode))
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)
  (reftex-plug-into-AUCTeX t))

(use-package markdown-mode
  :mode (("\\.md\\'"       . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode))
  :hook ((markdown-mode . visual-line-mode)    ; soft-wrap long lines
         (markdown-mode . flyspell-mode))      ; spell-check prose
  :custom
  (markdown-command "multimarkdown")
  (markdown-fontify-code-blocks-natively t)    ; syntax-highlight ```ruby etc.
  (markdown-header-scaling t)                  ; bigger fonts for # ## ###
  (markdown-asymmetric-header t))              ; cleaner header underlines

;; For markdoc from https://github.com/ochko/markdoc
;; (setq markdown-command "markdoc")

(use-package web-mode
  :mode (("\\.erb\\'"   . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.tsx\\'"   . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-indentation-params '(("lineup-args"    . nil)
                                 ("lineup-calls"   . nil)
                                 ("lineup-concats" . nil)
                                 ("lineup-ternary" . nil))))
;; (use-package yaml-ts-mode
;;   :ensure nil   ; built-in
;;   :mode "\\.ya?ml\\'")

(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode)  ; .yml and .yaml
  :custom (yaml-indent-offset 2))

(use-package slim-mode
  :mode "\\.slim\\'")

(use-package scss-mode
  :mode "\\.scss\\'")

(use-package sass-mode
  :mode "\\.sass\\'")

(use-package emmet-mode
  :hook ((web-mode . emmet-mode)
         (css-mode . emmet-mode)))   ; HTML expansion: div.css-class>ul>li*3 + TAB

;; auto install tree-sitter detected languages: lua, ruby, bash, etc.
(use-package treesit-auto
  :custom (treesit-auto-install 'prompt)
  :config (global-treesit-auto-mode))

(use-package lua-ts-mode
  :ensure nil   ; built-in
  :mode "\\.lua\\'"
  :custom
  (lua-ts-indent-offset 2))

(use-package terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode)
  :custom
  (terraform-indent-level 2))

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

;; use aspell for ispell
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))

;; ruby-mode
(setq ruby-insert-encoding-magic-comment nil)
;; treat underscore as part of word
(add-hook 'ruby-mode-hook 'superword-mode)
;;(add-hook 'ruby-mode-hook 'rbenv-use-corresponding)
(add-to-list 'auto-mode-alist
             '("\\.\\(rb\\|rake\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\|Guardfile\\|Rakefile\\|Dangerfile\\|Kaiserfile\\)\\'" . ruby-mode))


(defun create-scratch-buffer-ruby nil
  "create a scratch buffer in ruby mode"
  (interactive)
  (switch-to-buffer (get-buffer-create "*ruby*"))
  (ruby-mode))
(create-scratch-buffer-ruby)

;; Jumping between buffers
(global-set-key (kbd "C-o") "\C-xb\C-m")             ;; Cycle last two buffer
(global-set-key (kbd "M-o") 'other-window)           ;; same as C-x o
(global-set-key (kbd "M-0") 'delete-window)          ;; same as C-x 0
(global-set-key (kbd "M-1") 'delete-other-windows)   ;; same as C-x 1
(global-set-key (kbd "M-k") 'kill-buffer-and-window) ;; same as C-x k
(global-set-key (kbd "M-`") 'kill-current-buffer)    ;; original tmm-menubar

;;(dumb-jump-mode)
;;(global-set-key (kbd "M-g j") 'dumb-jump-go)
;;(global-set-key (kbd "M-g i") 'dumb-jump-back)
;; Obsoleted use xref: "M-." and "M-,"

;; Shorcuts
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c C-k") 'compile)

(global-set-key (kbd "ESC <right>") 'next-match)
(global-set-key (kbd "ESC <left>") 'pull-next-line)

(global-set-key (kbd "ESC <down>") 'end-of-buffer)
(global-set-key (kbd "ESC <up>") 'beginning-of-buffer)

(global-set-key (kbd "M-/") 'query-replace)         ;; original dabbrev-expand


(global-set-key (kbd "M-RET") "\C-e \C-m\C-i")      ;; insert new line and indeant

;; ace-jump-mode
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(global-set-key (kbd "M-7") 'ace-jump-word-mode)    ;; original digit-argument
(global-set-key (kbd "M-8") 'ace-jump-char-mode)    ;; original digit-argument
(global-set-key (kbd "M-9") 'ace-jump-line-mode)    ;; original digit-argument

;; align column with regexp pattern
(global-set-key (kbd "C-x a r") 'align-regexp)

(global-set-key (kbd "C-x r 5") 'replace-regexp-in-region)

;; yank current line
(global-set-key (kbd "C-c C-q") "\M-m\C- \C-e\M-w\M-m")
;; (global-set-key (kbd "M-w") 'save-region-or-current-line)

;; reload file similar to "C-x C-v"
(global-set-key (kbd "C-x C-r") "\C-xrma\C-m\C-x\C-v\C-m\C-xrba\C-m")

;; custom functions binding
(global-set-key (kbd "M-J") 'pull-next-line) ;; overlaps paredit binding!
(global-set-key (kbd "C-c C-w") 'duplicate-line)
(global-set-key (kbd "M-p") 'insert-line-above)
(global-set-key (kbd "M-n") 'insert-line-below)

;; Cyrillic
(global-set-key (kbd "M-ө") 'forward-word)
(global-set-key (kbd "M-м") 'backward-word)
(global-set-key (kbd "M-б") 'paredit-forward-kill-word)
(global-set-key (kbd "M-л") 'downcase-word)
(global-set-key (kbd "M-ё") 'capitalize-word)
(global-set-key (kbd "M-Ь") 'beginning-of-buffer)
(global-set-key (kbd "M-с") 'scroll-down-command)
(global-set-key (kbd "M-ц") 'save-region-or-current-line)
(global-set-key (kbd "C-ю") 'undo)

;; delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; operate faster on big buffers
(add-hook 'find-file-hooks
          (lambda ()
             ;; 5 mb
            (when (> (buffer-size) (* 5 (* 1024 1024)) )
              (buffer-disable-undo)
              (fundamental-mode))))

(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ag auctex avy clipetty consult corfu ef-themes emmet-mode
        expand-region forge go-mode kkp orderless sass-mode scss-mode
        slim-mode solarized-theme terraform-mode treesit-auto vertico
        web-mode yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
