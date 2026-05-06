;;; 03-keys.el --- Global keybindings and helper functions -*- lexical-binding: t -*-

;; ----------------------------------------
;; which-key — popup with available keybindings under a prefix
;; ----------------------------------------
(use-package which-key
  :ensure nil
  :init (which-key-mode))

;; ----------------------------------------
;; Kitty Keyboard Protocol — terminal can transmit C-;, C-,, C-., etc.
;; ----------------------------------------
(use-package kkp
  :ensure t
  :hook (tty-setup . global-kkp-mode))
;; Two more keys bindings now available after enabling KKP. C-, C-.

;; ----------------------------------------
;; <f3> prefix-map foundation
;; ----------------------------------------
(define-prefix-command 'my-fn-map)
(global-set-key (kbd "<f3>") 'my-fn-map)

;; ----------------------------------------
;; Helper functions for register/bookmark dispatch
;; ----------------------------------------
(defun my/bookmark-set-here ()
  "Set a bookmark named after the last key pressed."
  (interactive)
  (let ((name (single-key-description last-command-event)))
    (bookmark-set name)
    (message "Set bookmark %s" name)))

(defun my/bookmark-jump-here ()
  "Jump to a bookmark named after the last key pressed."
  (interactive)
  (bookmark-jump (single-key-description last-command-event)))

(defun my/winconf-save-here ()
  "Save current window configuration to a register named after the last key."
  (interactive)
  (window-configuration-to-register last-command-event)
  (message "Saved window config to register %c" last-command-event))

(defun my/winconf-restore-here ()
  "Restore window configuration from a register named after the last key."
  (interactive)
  (jump-to-register last-command-event))

;; ----------------------------------------
;; All keybindings
;; ----------------------------------------
(use-package emacs
  :ensure nil
  :bind
  (;; ===== Global =====
   ;; Window and buffer navigation
   ("C-o" . my/switch-to-last-buffer)
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
   ("ESC <left>"  . previous-match)
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
   ("C-c C-k" . compile)
   ;; ===== <f3> prefix map =====
   (:map my-fn-map
         ;; File and buffer
         ("v" . find-file)
         ("s" . save-buffer)
         ("k" . kill-current-buffer)
         ("i" . indent-region)
         ;; Movement
         ("n"       . next-error)
         ("p"       . previous-error)
         ("<right>" . next-match)
         ("<left>"  . previous-match)
         ("<down>"  . end-of-buffer)
         ("<up>"    . beginning-of-buffer)
         ("a"       . beginning-of-defun)
         ("e"       . end-of-defun)
         ("f"       . forward-sexp)
         ("b"       . backward-sexp)
         ;; Marking and yanking
         ("m" . mark-sexp)
         ("h" . mark-defun)
         ("y" . my/copy-current-line)
         ;; Window-config registers (save/restore)
         ("^" . my/winconf-save-here)    ("6" . my/winconf-restore-here)
         ("&" . my/winconf-save-here)    ("7" . my/winconf-restore-here)
         ("*" . my/winconf-save-here)    ("8" . my/winconf-restore-here)
         ("(" . my/winconf-save-here)    ("9" . my/winconf-restore-here)
         (")" . my/winconf-save-here)    ("0" . my/winconf-restore-here)
         ;; Bookmark set/jump
         ("!" . my/bookmark-set-here)    ("1" . my/bookmark-jump-here)
         ("@" . my/bookmark-set-here)    ("2" . my/bookmark-jump-here)
         ("#" . my/bookmark-set-here)    ("3" . my/bookmark-jump-here)
         ("$" . my/bookmark-set-here)    ("4" . my/bookmark-jump-here)
         ("%" . my/bookmark-set-here)    ("5" . my/bookmark-jump-here))))

(provide '03-keys)
;;; 03-keys.el ends here
