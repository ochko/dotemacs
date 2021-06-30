
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
(package-initialize)

(server-start)

;; silence bell sound
(setq visible-bell t)
;; turn down the time to echo keystrokes
(setq echo-keystrokes 0.1)
;; use the echo area for dialog
(setq use-dialog-box nil)
;; always highlight parentheses
(show-paren-mode t)
;; disable menubar and scrollbar
(menu-bar-mode -1)
(setq scroll-bar-mode nil)

;; disable backup/autosave files
(setq make-backup-files nil
      auto-save-default nil
      auto-save-list-file-name nil)
;; Or store them in system's temp directory
;; (setq backup-directory-alist `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; delete active region typing
(delete-selection-mode t)
(transient-mark-mode t)

;; enable line and column number
(line-number-mode t)
(column-number-mode t)

;; turn off wrapping long lines for both full and split windows
(setq truncate-lines t
      truncate-partial-width-windows t)

;; tabs
(setq-default tab-width 2
              indent-tabs-mode nil)
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq sh-basic-offset 2)
(setq sh-indentation 2)

;; disable version control backends(cvs, svn, bzr, hg git etc..)
(setq-default vc-handled-backends nil)

;; only allow safe file variables and ignore the rest
(setq enable-local-variables :safe)

;; start with empty scratch buffer
(setq inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)
(switch-to-buffer "**")

(defun create-scratch-buffer-ruby nil
  "create a scratch buffer in ruby mode"
  (interactive)
  (switch-to-buffer (get-buffer-create "*ruby*"))
  (ruby-mode))
(create-scratch-buffer-ruby)

;; case-insensitive search
(setq case-fold-search t)

;; move between windows using shift + arrow keys
(windmove-default-keybindings)

;; default language and input method is unicode
(setq current-language-environment "UTF-8"
      default-input-method "rfc1345")

;; tramp over ssh
(setq tramp-default-method "ssh")

;; save bookmarks in emacs' directory insteaf user's home
(setq bookmark-default-file (expand-file-name ".bookmark" user-emacs-directory))
;; ‘C-x r m’ – set
;; ‘C-x r b’ – jump
;; ‘C-x r l’ – list
;; ‘M-x bookmark-delete’ – delete

;; shorter query answer
(defalias 'yes-or-no-p 'y-or-n-p)

;; set some symbols' properties
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(eval-when-compile
  (require 'cl))

;; make buffer names unique
(eval-when-compile
  (require 'uniquify))
(setq uniquify-buffer-name-style 'reverse)

;; dired. use gnu ls(needs coreutls package)
(setq insert-directory-program "/usr/local/opt/coreutils/libexec/gnubin/ls")
(setq dired-listing-switches "-aBhl --group-directories-first")
(setq dired-dwim-target t)
;; Then, go to dired, split your window, & go to another dired directory.
;; When press C to copy, the other dir in the split pane will be default destination.

;; ido-mode
(eval-when-compile
  (require 'ido))
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t
      ido-ignore-files '("config.ru" "coverage"))

;; use aspell for ispell
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))

(defun emacs-user-dir-concat (path)
  (file-name-as-directory
   (concat (file-name-as-directory user-emacs-directory) path)))

(let ((user-elisp-dir (emacs-user-dir-concat "elisp")))
  (when (file-directory-p user-elisp-dir)
    (add-to-list 'load-path user-elisp-dir)
    (require 'el-get-initializer)
    (require 'my-functions)))

;; Color theme
(load-theme 'solarized-dark t)

;; ag
(global-set-key (kbd "C-c C-g") 'ag-project)

;; ruby-mode
(setq ruby-insert-encoding-magic-comment nil)

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; smex (history and searching on top of M-x)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; smart-tab
(global-smart-tab-mode 1)

;; expand-region
(global-set-key (kbd "M-=") 'er/expand-region)

;; visual-regexp
;; (define-key global-map (kbd "C-c r") 'vr/replace)
;; (define-key global-map (kbd "C-c q") 'vr/query-replace)
;; use multiple-cursors
;; (define-key global-map (kbd "C-c m") 'vr/mc-mark)
;; use visual-regexp-steroids's isearch instead of the built-in regexp isearch
;; (define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
;; (define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

;; projectile
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-rails-mode-map (kbd "C-c l") 'projectile-rails-command-map)

;; Transpose stuff with M-t
;; (global-set-key (kbd  "M-t") nil) ;; which used to be transpose-words
;; (global-set-key (kbd  "M-t M-t") 'transpose-words)
;; (global-set-key (kbd  "M-t l") 'transpose-lines)
;; (global-set-key (kbd  "M-t w") 'transpose-words)
;; (global-set-key (kbd  "M-t t") 'transpose-words)
;; (global-set-key (kbd  "M-t s") 'transpose-sexps)

;; pbcopy
(global-set-key (kbd "C-c C-c") 'pbcopy-select-text)
(global-set-key (kbd "C-c C-p") 'pbcopy-select-text)
;; for non pbcopy envs
(setq x-select-enable-clipboard t)

;; mo-git-blame
(global-set-key (kbd "M-g b") 'mo-git-blame-current)
;; (global-set-key (kbd "M-g f") 'mo-git-blame-file)

;; magit
(global-set-key (kbd "M-s") 'magit-status) ;; overlaps paredit
(global-set-key (kbd "M-g s") 'magit-status)
;; rinari
;; (global-set-key (kbd "C-c C-v") 'rinari-find-view)

;; org-mode
;; (global-set-key (kbd "C-c a") 'org-agenda)

;; mac-app-binding
;; (global-set-key (kbd "C-c C-e") 'mac-open-with-textedit)

;; Jumping between buffers
(global-set-key (kbd "C-o") "\C-xb\C-m")             ;; Cycle last two buffer
(global-set-key (kbd "M-o") 'other-window)           ;; same as C-x o
(global-set-key (kbd "M-0") 'delete-window)          ;; same as C-x 0
(global-set-key (kbd "M-1") 'delete-other-windows)   ;; same as C-x 1
(global-set-key (kbd "M-k") 'kill-buffer-and-window) ;; same as C-x k

;;(dumb-jump-mode)
(global-set-key (kbd "M-g j") 'dumb-jump-go)
(global-set-key (kbd "M-g i") 'dumb-jump-back)

;; Shorcuts
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c C-k") 'compile)

(global-set-key (kbd "ESC <right>") 'next-match)
(global-set-key (kbd "ESC <left>") 'pull-next-line)

(global-set-key (kbd "ESC <down>") 'end-of-buffer)
(global-set-key (kbd "ESC <up>") 'beginning-of-buffer)

;; insert new line and indeant
(global-set-key (kbd "M-RET") "\C-e \C-m\C-i")

;; open dired in current buffer's dir
(global-set-key (kbd "M-'") 'dired-jump)

;; align column with regexp pattern
(global-set-key (kbd "C-x a r") 'align-regexp)

(global-set-key (kbd "C-x r 5") 'replace-regexp-in-region)

;; yank current line
(global-set-key (kbd "C-c C-q") "\M-m\C- \C-e\M-w\M-m")
;; (global-set-key (kbd "M-w") 'save-region-or-current-line)

;; reload file similar to "C-x C-v"
(global-set-key (kbd "C-x C-r") "\C-xrma\C-m\C-x\C-v\C-m\C-xrba\C-m")

;; custom functions binding
(global-set-key (kbd "M-J") 'pull-next-line) ;; overlaps paredit binding!
(global-set-key (kbd "C-c C-w") 'duplicate-line)
(global-set-key (kbd "M-p") 'insert-line-above)
(global-set-key (kbd "M-n") 'insert-line-below)

;; Cyrillic
(global-set-key (kbd "M-ө") 'forward-word)
(global-set-key (kbd "M-м") 'backward-word)
(global-set-key (kbd "M-б") 'paredit-forward-kill-word)
(global-set-key (kbd "M-л") 'downcase-word)
(global-set-key (kbd "M-ё") 'capitalize-word)
(global-set-key (kbd "M-Ь") 'beginning-of-buffer)
(global-set-key (kbd "M-с") 'scroll-down-command)
(global-set-key (kbd "M-ц") 'save-region-or-current-line)
(global-set-key (kbd "C-ю") 'undo)

;; Hooks

;; delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; operate faster on big buffers
(add-hook 'find-file-hooks
          (lambda ()
             ;; 5 mb
            (when (> (buffer-size) (* 5 (* 1024 1024)) )
              (buffer-disable-undo)
              (fundamental-mode))))

(add-hook 'emacs-startup-hook
          (lambda ()
            (el-get-init 'forge)
            (org-reload)))

(add-hook 'dired-mode-hook
          (lambda ()
            (setq dired-details-hidden-string "")
            (dired-hide-details-mode)
            (dired-sort-toggle-or-edit)))
