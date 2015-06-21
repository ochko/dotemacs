;; assume text file as markdown
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))

;; Install Docter to use preview(https://github.com/alampros/Docter)
;; (setq markdown-command "gfm")

;; Install markdoc from https://github.com/ochko/markdoc
(setq markdown-command "markdoc")
