(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)  ; ask for master file in multi-file projects
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plugin-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
