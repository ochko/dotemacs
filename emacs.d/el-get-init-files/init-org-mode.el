;; org-mode

;; add one WIP status between TODO and DONE
(setq org-log-done t
      org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-export-with-sub-superscripts nil
      org-agenda-todo-ignore-deadlines t
      org-pretty-entities nil
      org-show-notification-handler 'message
      org-todo-keywords '((sequence "TODO" "WIP" "DONE")))

(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)
            ;;(writegood-mode)
            (flyspell-mode)))

;; fix windmove keys in org-mode
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)
