;;; Theme -*- lexical-binding: t -*-

;; Use it when there is trouble in load-theme
;; (load-theme 'modus-vivendi t) ; built-in

(use-package ef-themes
  :ensure t
  :custom
  (ef-themes-to-toggle '(ef-dream ef-reverie))   ; two preferred themes
  :config
  ;; ef-owl
  (load-theme 'ef-dream t))

;; (use-package solarized-theme
;;   :custom
;;   (solarized-distinct-fringe-background t)    ; fringe stands out from background
;;   (solarized-use-variable-pitch nil)          ; don't change font for headings
;;   (solarized-high-contrast-mode-line t)
;;   (solarized-use-less-bold t)
;;   (solarized-use-more-italic t)
;;   (solarized-emphasize-indicators nil)        ; subtler git-gutter/flycheck colors
;;   (solarized-scale-org-headlines nil)         ; don't scale org headlines
;;   ;; Avoid all font-size changes
;;   (solarized-height-minus-1 1)
;;   (solarized-height-plus-1 1)
;;   (solarized-height-plus-2 1)
;;   (solarized-height-plus-3 1)
;;   (solarized-height-plus-4 1)
;;   :config
;;   (load-theme 'solarized-dark t))

(provide '14-ui-theme)
