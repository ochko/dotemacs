(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode)  ; .yml and .yaml
  :custom (yaml-indent-offset 2))

;; (use-package yaml-ts-mode
;;   :ensure nil   ; built-in
;;   :mode "\\.ya?ml\\'")


(use-package markdown-mode
  :mode (("\\.md\\'"       . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode))
  :hook ((markdown-mode . visual-line-mode)    ; soft-wrap long lines
         (markdown-mode . flyspell-mode))      ; spell-check prose
  :custom
  (markdown-command "multimarkdown")
  (markdown-fontify-code-blocks-natively t)    ; syntax-highlight ```ruby etc.
  (markdown-header-scaling t)                  ; bigger fonts for # ## ###
  (markdown-asymmetric-header t))              ; cleaner header underlines

;; For markdoc from https://github.com/ochko/markdoc
;; (setq markdown-command "markdoc")

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
  (reftex-plug-into-AUCTeX t))

(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)        ; show agenda
         ("C-c c" . org-capture)       ; quick capture
         ("C-c l" . org-store-link))   ; store link to current location
  :hook ((org-mode . visual-line-mode) ; soft-wrap long lines
         (org-mode . org-indent-mode)) ; visual indent under headings
  :custom
  (org-startup-folded 'content)        ; show headings, hide bodies on open
  (org-hide-emphasis-markers t)        ; hide *bold* and /italic/ markers
  (org-pretty-entities t)              ; \alpha shows as α
  (org-src-tab-acts-natively t)        ; TAB in code blocks indents per language
  (org-src-fontify-natively t)         ; syntax highlight inside ``` blocks
  (org-edit-src-content-indentation 0) ; don't indent edited code blocks
  ;; Where org files live
  (org-directory "~/Documents/Notes")
  (org-default-notes-file (expand-file-name "notes.org" org-directory))
  (org-agenda-files (list org-directory))
  ;; TODO keywords
  (org-todo-keywords
   '((sequence "TODO(t)" "WIP(p)" "DOING(g)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))))

;; Spell check via jinx + Enchant (using hunspell as backend)
;;
;; Setup:
;;   brew install pkg-config enchant hunspell
;;
;; Download US English dictionary:
;;   mkdir -p ~/Library/Spelling
;;   curl -L -o ~/Library/Spelling/en_US.aff \
;;     https://raw.githubusercontent.com/LibreOffice/dictionaries/master/en/en_US.aff
;;   curl -L -o ~/Library/Spelling/en_US.dic \
;;     https://raw.githubusercontent.com/LibreOffice/dictionaries/master/en/en_US.dic

(use-package jinx
  :hook (emacs-startup . global-jinx-mode)
  :bind (("M-$"   . jinx-correct)
         ("C-M-$" . jinx-languages))
  :custom
  (jinx-languages "en_US")
  :config
  ;; Skip code, links, and tags in Markdown
  (add-to-list 'jinx-exclude-faces
               '(markdown-mode
                 markdown-code-face
                 markdown-pre-face
                 markdown-inline-code-face
                 markdown-language-keyword-face
                 markdown-link-face
                 markdown-url-face
                 markdown-reference-face
                 markdown-html-attr-name-face
                 markdown-html-attr-value-face
                 markdown-html-tag-name-face))
  ;; Same idea for org-mode if you use it
  (add-to-list 'jinx-exclude-faces
               '(org-mode
                 org-block
                 org-block-begin-line
                 org-block-end-line
                 org-code
                 org-verbatim
                 org-link
                 org-meta-line
                 org-property-value)))

(provide '45-textual)
