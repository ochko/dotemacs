;;; Navigating and browsing within buffers

;; jump withing open buffer(s)
(use-package avy
  :bind (("C-;" . avy-goto-char-timer)
         ("M-7" . avy-goto-word-1) ; not working
         ("M-8" . avy-goto-char-2) ; not working
         ("M-9" . avy-goto-line)   ; not working
         ("C-x SPC" . avy-pop-mark)
         (:map my-fn-map
               ("l" . avy-goto-line)
               ("j" . avy-goto-word-1)
               ("c" . avy-goto-char-2)
               ("SPC" . avy-pop-mark)))
  :custom
  (avy-background nil)
  (avy-all-windows nil))

;; make buffer names unique
(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'reverse))

(provide '24-nav-buff)
