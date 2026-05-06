;;; Built-in UI and editing settings -*- lexical-binding: t -*-

(use-package emacs
  :ensure nil
  :init
  ;; Behavior
  (setq visible-bell t
        echo-keystrokes 0.1           ; turn down the time to echo keystrokes
        use-dialog-box nil            ; use the echo area for dialog
        inhibit-startup-screen t
        inhibit-splash-screen t
        initial-scratch-message nil)

  ;; Per-mode indentation
  (setq css-indent-offset 2
        js-indent-level   2
        sh-basic-offset   2
        sh-indentation    2)

  ;; Buffer-local defaults
  (setq-default tab-width 2
                indent-tabs-mode nil
                truncate-lines t       ; turn off wrapping long lines for both full and split windows
                truncate-partial-width-windows t
                case-fold-search t)
  :custom
  (use-short-answers t)
  :config
  ;; Frame
  (menu-bar-mode -1)
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; doesn't exist as a function in non-GUI builds
  (when (fboundp 'tool-bar-mode)   (tool-bar-mode -1))   ; doesn't exist as a function in non-GUI builds

  ;; Editing modes
  (show-paren-mode 1)               ; always highlight parentheses
  (delete-selection-mode 1)         ; delete active region typing
  (column-number-mode 1)            ; enable line and column number
  (line-number-mode 1))


;; start with empty scratch buffer
;;(setq initial-buffer-choice
;;      (lambda ()
;;        (let ((buf (get-buffer-create "**")))
;;          (with-current-buffer buf
;;            (when (zerop (buffer-size))
;;              (text-mode)))   ; or whatever default mode you want
;;          buf)))

(defun my/ensure-text-scratch ()
  "Create *ruby-scratch* in the background, without switching to it."
  (let ((buf (get-buffer-create "**")))
    (with-current-buffer buf
      (when (zerop (buffer-size))
        (text-mode)))))

(add-hook 'after-init-hook #'my/ensure-text-scratch)

(provide '10-ui-builtin)
