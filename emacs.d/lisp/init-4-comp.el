;;; init-4-comp.el --- completion

;; (use-package ido
;;   :ensure nil                           ; built-in
;;   :custom
;;   (ido-enable-flex-matching t)
;;   (ido-use-virtual-buffers t)
;;   (ido-ignore-files '("config.ru" "coverage"))
;;   :config
;;   (ido-mode 1))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(use-package recentf
  :ensure nil
  :init (recentf-mode 1)
  :custom (recentf-max-saved-items 200))

;; Enable Vertico.
(use-package vertico
  ;; :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for 'vertico-next/previous'
  :init
  (vertico-mode))

(use-package consult
  :bind (("M-SPC" . consult-buffer)))

;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. 'vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; Use the 'orderless' completion style.
(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring


(provide 'init-4-comp)
;;; init-4-comp.el ends here
