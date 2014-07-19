;; org-mode

;; add one WIP status between TODO and DONE
(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "WIP" "DONE"))
      org-todo-keyword-faces '(("WIP" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook (lambda () (flyspell-mode)))
(add-hook 'org-mode-hook (lambda () (writegood-mode)))

(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)

;; fix windmove keys in org-mode
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)
