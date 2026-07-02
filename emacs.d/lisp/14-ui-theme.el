;;; Theme -*- lexical-binding: t -*-

;; Use it when there is trouble in load-theme
;; (load-theme 'modus-vivendi t) ; built-in

(use-package ef-themes
  :ensure t
  :custom
  (ef-themes-to-toggle '(modus-vivendi-tinted modus-operandi-tinted))   ; ef-dream ef-reverie
  :config
  (load-theme 'modus-vivendi-tinted t))

(provide '14-ui-theme)
