;;; init-1-ui.el --- built-in ui settings

;; disable menubar
(menu-bar-mode -1)
;; disable scrollbar
(setq scroll-bar-mode nil)
;; silence bell sound
(setq visible-bell t)
;; turn down the time to echo keystrokes
(setq echo-keystrokes 0.1)
;; use the echo area for dialog
(setq use-dialog-box nil)
;; always highlight parentheses
(show-paren-mode t)

;; delete active region typing
(delete-selection-mode t)
(transient-mark-mode t)

;; enable line and column number
(line-number-mode t)
(column-number-mode t)

;; turn off wrapping long lines for both full and split windows
(setq truncate-lines t
      truncate-partial-width-windows t)

;; tabs
(setq-default tab-width 2
              indent-tabs-mode nil)
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq sh-basic-offset 2)
(setq sh-indentation 2)

;; start with empty scratch buffer
(setq inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)

(switch-to-buffer "**")

(provide 'init-1-ui)
;;; init-1-ui.el ends here
