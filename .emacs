(server-start)

;; silence bell sound
(setq visible-bell t)

;; disable menubar and scrollbar
(menu-bar-mode -1)
(setq scroll-bar-mode nil)

;; disable backup/autosave files
(setq make-backup-files nil
      auto-save-default nil
      auto-save-list-file-name nil)

;; enable line and column number
(line-number-mode t)
(column-number-mode t)

;; turn off wrapping long lines for both full and split windows
(setq truncate-lines t
      truncate-partial-width-windows t)

;; tabs
(setq-default tab-width 2
              indent-tabs-mode nil)

;; disable version control backends(cvs, svn, bzr, hg git etc..)
(setq-default vc-handled-backends nil)

;; only allow safe file variables and ignore the rest
(setq enable-local-variables :safe)

;; start with empty scratch buffer
(setq inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)
(switch-to-buffer "**")

;; case-insensitive search
(setq case-fold-search t)

;; default language and input method is unicode
(setq current-language-environment "UTF-8"
      default-input-method "rfc1345")

;; save bookmarks in emacs' directory insteaf user's home
(setq bookmark-default-file "~/.emacs.d/.bookmark")
;; ‘C-x r m’ – set
;; ‘C-x r b’ – jump
;; ‘C-x r l’ – list
;; ‘M-x bookmark-delete’ – delete

(eval-when-compile
  (require 'cl))

;; make buffer names unique
(eval-when-compile
  (require 'uniquify))
(setq uniquify-buffer-name-style 'reverse)

;; Interactively Do Things
(eval-when-compile
  (require 'ido))
(ido-mode t)

;; move between windows using shift + arrow keys
(windmove-default-keybindings)
;; fix windmove keys in org-mode
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; el-get (https://github.com/dimitri/el-get)
;; Paste this into *scratch* buffer, hit C-j, and you have a working el-get.
;;
;; (url-retrieve
;;  "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;;  (lambda (s)
;;    (goto-char (point-max))
;;    (eval-print-last-sexp)))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq ochko:el-get-packages
      '(
        ag
        smart-tab
        thing-cmds
        anything
        thingatpt+
        magit
        rbenv
        pbcopy
        mo-git-blame
        feature-mode
        yaml-mode
        js2-mode
        rinari
        org-mode
        deft
        coffee-mode
        rspec-mode
        haml-mode
        slim-mode
        markdown-mode
        php-mode
        actionscript-mode
        dired-details+
        color-theme-solarized
        ))
(el-get 'sync ochko:el-get-packages)

;; ag
;; (setq ag-highlight-search t)
(setq ag-reuse-buffers t)
(global-set-key (kbd "C-c C-a") 'ag-project)
(global-set-key (kbd "C-c C-g") 'ag-project)
(global-set-key (kbd "C-c C-f") 'ag-project-at-point)

;; smart-tab
(global-smart-tab-mode 1)

;; pbcopy
(global-set-key (kbd "C-c C-c") 'pbcopy-select-text)
(global-set-key (kbd "C-c C-p") 'pbcopy-select-text)

;; mo-git-blame
(autoload 'mo-git-blame-current "mo-git-blame" nil t)
(global-set-key (kbd "M-g b") 'mo-git-blame-current)
;; (autoload 'mo-git-blame-file "mo-git-blame" nil t)
;; (global-set-key (kbd "M-g f") 'mo-git-blame-file)

;; rbenv
(setq rbenv-show-active-ruby-in-modeline nil)
(setq rbenv-modeline-function 'rbenv--modeline-plain)
(global-rbenv-mode)
;; (rbenv-use-corresponding)

;; feature-mode(cucumber)
(setq feature-default-language "en")

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)
(setq js2-mirror-mode nil)

;; Rinari
(add-to-list 'auto-mode-alist
             '("\\.\\(rb\\|rake\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\|Guardfile\\|Rakefile\\)\\'" . ruby-mode))
(define-key ruby-mode-map (kbd "C-c f r") 'rspec-find-spec-or-target-other-window)

;; coffee
(defun coffee-custom ()
  "coffee-mode-hook"

  ;; CoffeeScript uses two spaces.
  (make-local-variable 'tab-width)
  (set 'tab-width 2)

  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--bare"))

  ;; *Messages* spam
  (setq coffee-debug-mode t)

  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

  ;; Compile '.coffee' files on every save
  (and (file-exists-p (buffer-file-name))
       (file-exists-p (coffee-compiled-file-name))
       (coffee-cos-mode t)))

(add-hook 'coffee-mode-hook 'coffee-custom)

;; Rspec
(defun rspec-mode-customize ()
  "rspec-mode-hook"

  (setq rspec-use-rake-flag nil)
  (rspec-spec-command "rspec")
  (rspec-use-bundle t))

(add-hook 'rspec-mode-hook 'rspec-mode-customize)

;; Markdown
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))
;; Install Docter to use preview(https://github.com/alampros/Docter)
(setq markdown-command "gfm")

;; Deft
(setq deft-extension nil)
(setq deft-text-mode 'org-mode)

;; PHP
(add-to-list 'auto-mode-alist
             '("\\.\\(php\\|inc\\)\\'" . php-mode))

;; ActionScript
(add-to-list 'auto-mode-alist '("\\.mxml$" . actionscript-mode))

;; Color theme
(load-theme 'solarized-dark t)

;; Customizations

(defalias 'yes-or-no-p 'y-or-n-p)

(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq tramp-default-method "ssh")

(global-set-key (kbd "C-c C-v") 'rinari-find-view)
(global-set-key (kbd "M-s") 'magit-status)
(global-set-key (kbd "C-o") "\C-xb\C-m")             ;; Cycle last two buffer
(global-set-key (kbd "M-o") 'other-window)           ;; same as C-x o
(global-set-key (kbd "M-0") 'delete-window)          ;; same as C-x 0
(global-set-key (kbd "M-1") 'delete-other-windows)   ;; same as C-x 1
(global-set-key (kbd "M-k") 'kill-buffer-and-window) ;; same as C-x k
(global-set-key (kbd "C-x a r") 'align-regexp)       ;; align with regexp pattern

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
   (dolist (buf (buffer-list))
     (with-current-buffer buf
       (if (eq mode major-mode)
           (add-to-list 'buffer-mode-matches buf))))
   buffer-mode-matches))

(global-set-key (kbd "C-c o") 'occur)

(defun pull-next-line()
  "Pull the next line onto the end of the current line,
   compressing whitespace. (http://bit.ly/BnYG5)"
  (interactive)
  (move-end-of-line 1)
  (kill-line)
  (just-one-space))

(global-set-key (kbd "M-J") 'pull-next-line)

(defun duplicate-line()
  "duplicate current line. (http://bit.ly/3rxxq)"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))
(global-set-key (kbd "C-c C-w") 'duplicate-line)

(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

;; Insert new line and indent
(global-set-key (kbd "M-RET") "\C-e \C-m\C-i")

;; Yank current line
(global-set-key (kbd "C-c C-q") "\M-m\C- \C-e\M-w\M-m")

;; Reload file
(global-set-key (kbd "C-x C-r") "\C-xrma\C-m\C-x\C-v\C-m\C-xrba\C-m")

;; Query Replace in open Buffers
(defun query-replace-in-open-buffers (arg1 arg2)
  "query-replace in open files"
  (interactive "sQuery Replace in open Buffers: \nsquery with: ")
  (mapcar
   (lambda (x)
     (find-file x)
     (save-excursion
       (beginning-of-buffer)
       (query-replace arg1 arg2)))
   (delq
    nil
    (mapcar
     (lambda (x)
       (buffer-file-name x))
     (buffer-list)))))
(put 'narrow-to-region 'disabled nil)

;; Operate faster on big buffers
(defun find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))

(add-hook 'find-file-hooks 'find-file-check-make-large-file-read-only-hook)
