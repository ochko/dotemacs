;;; 03-keys.el --- Global keybindings and helper functions -*- lexical-binding: t -*-

(use-package which-key
  :ensure nil
  :init (which-key-mode))

;; ----------------------------------------
;; Kitty Keyboard protocol(KKP) support.
;; An alternative way to handle keyboard input for programs running in the terminal.
;; ----------------------------------------
(use-package kkp
  :ensure t
  :hook (tty-setup . global-kkp-mode))
;; Two more keys bindings now available after enabling KKP
;; (global-set-key (kbd "C-,") '....)
;; (global-set-key (kbd "C-.") '....)


(define-prefix-command 'my-fn-map)
(global-set-key (kbd "<f3>") 'my-fn-map)

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

(use-package emacs
  :ensure nil
  :bind
  ;; Window and buffer navigation
  (("C-o" . my/switch-to-last-buffer)
   ("M-o" . other-window)            ; same as C-x o
   ("M-0" . delete-window)           ; same as C-x 0
   ("M-1" . delete-other-windows)    ; same as C-x 1
   ("M-k" . kill-buffer-and-window)  ; same as C-x k
   ("M-`" . kill-current-buffer)
   ;; Search and replace
   ("M-/"     . query-replace)
   ("C-x a r" . align-regexp)
   ("C-x r 5" . my/replace-regexp-in-region)
   ;; Buffer-wide navigation via ESC arrows
   ("ESC <right>" . next-match)
   ("ESC <left>"  . previous-error)
   ("ESC <down>"  . end-of-buffer)
   ("ESC <up>"    . beginning-of-buffer)
   ;; Editing helpers
   ("M-J"     . my/pull-next-line)
   ("M-RET"   . my/open-line-below-and-indent)
   ("C-c C-q" . my/copy-current-line)
   ("C-x C-r" . my/reload-file-keep-point)
   ("M-p"     . my/insert-line-above)
   ("M-n"     . my/insert-line-below)
   ("C-c C-w" . duplicate-line)
   ;; Misc
   ("C-c o"   . occur)
   ("C-c C-k" . compile)))


(provide '03-keys)
