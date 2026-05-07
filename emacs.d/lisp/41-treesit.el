;;; Tree-sitter grammars

;; for installing tree-sitter grammars with M-x treesit-auto-install-all
(use-package treesit-auto
  :ensure t
  :commands (treesit-auto-install-all)
  :custom
  (treesit-auto-langs '(bash c cpp dockerfile gitcommit go gomod gowork html javascript json markdown lua org python ruby sql tsx typescript yaml)))


;; Major mode remaps
(dolist (mapping '((c-mode              . c-ts-mode)
                   (c++-mode            . c++-ts-mode)
                   (c-or-c++-mode       . c-or-c++-ts-mode)
                   (js-mode             . js-ts-mode)
                   (javascript-mode     . js-ts-mode)
                   (js2-mode            . js-ts-mode)
                   (js-json-mode        . json-ts-mode)
                   (mhtml-mode          . html-ts-mode)
                   (python-mode         . python-ts-mode)
                   (sgml-mode           . html-ts-mode)))
  (add-to-list 'major-mode-remap-alist mapping))


(provide '41-treesit)
