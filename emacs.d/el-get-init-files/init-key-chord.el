(key-chord-mode 1)

(key-chord-define-global "j;" 'ace-jump-char-mode)
(key-chord-define-global "jk" 'ace-jump-word-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)

(key-chord-define-global "fp" 'ido-find-file)
(key-chord-define-global "bf" 'switch-to-buffer)
(key-chord-define-global "jb" 'bookmark-jump)
(key-chord-define-global ",." 'other-window)

(key-chord-define-global "gs" 'magit-status)
(key-chord-define-global "zx" 'dumb-jump-go)
(key-chord-define-global "xc" 'smex)
(key-chord-define-global "cv" "\M-m\C- \C-e\M-w\M-m") ;; yank current line
(key-chord-define-global "vb" "\C-x\C-s")
(key-chord-define-global "`\\" 'kill-this-buffer)

(key-chord-define-global "ag" 'ag-project)
(key-chord-define-global "" 'ag-project)
