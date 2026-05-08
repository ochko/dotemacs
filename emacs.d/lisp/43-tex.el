;; TeX/LaTex authoring
(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . visual-line-mode)
         (LaTeX-mode . flyspell-mode)
         (LaTeX-mode . LaTeX-math-mode))
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)
  (reftex-plug-into-AUCTeX t)
  (TeX-command-default "LatexMk")
  (TeX-save-query nil)
  (TeX-PDF-mode t))

(use-package auctex-latexmk
  :init
  (auctex-latexmk-setup)
  :custom
  (auctex-latexmk-inherit-TeX-PDF-mode t))

(defun my/tex-compile-and-view ()
  "Run latexmk (or all needed TeX commands) then open the viewer."
  (interactive)
  (TeX-save-document (TeX-master-file))
  (TeX-command-sequence '("LatexMk" "View") t))

(define-key LaTeX-mode-map (kbd "C-c v") #'my/tex-compile-and-view)

(provide '43-tex)
