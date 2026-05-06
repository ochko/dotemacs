;;; --- Encoding and input methods -*- lexical-binding: t -*-

(use-package emacs
  :ensure nil
  :init
  (set-language-environment "UTF-8")
  (setq default-input-method "rfc1345"))

;; Map Cyrillic keys to their Latin keyboard-layout equivalents
;; so M-ц works as M-w, C-ю as C-x, etc. Replaces 9 manual bindings.
(use-package reverse-im
  :custom (reverse-im-input-methods '("russian-computer"))
  :config (reverse-im-mode))

(provide '07-i18n)
