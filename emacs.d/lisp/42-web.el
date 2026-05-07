(use-package web-mode
  :mode (("\\.erb\\'"   . web-mode)
         ("\\.tsx\\'"   . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-indentation-params '(("lineup-args"    . nil)
                                 ("lineup-calls"   . nil)
                                 ("lineup-concats" . nil)
                                 ("lineup-ternary" . nil))))
(use-package html-ts-mode
  :ensure nil
  :mode "\\.html?\\'")

(use-package typescript-ts-mode
  :ensure nil
  :mode "\\.ts\\'")

(use-package tsx-ts-mode
  :ensure nil
  :mode "\\.tsx\\'")

(use-package slim-mode
  :mode "\\.slim\\'")

(use-package scss-mode
  :mode "\\.scss\\'")

(use-package sass-mode
  :mode "\\.sass\\'")

;; HTML expansion: div.css-class>ul>li*3 + TAB
(use-package emmet-mode
  :hook ((web-mode . emmet-mode)
         (css-mode . emmet-mode)))


(provide '42-web)
