(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, nthey won't work right.
 '(auto-save-default nil)
 '(auto-save-list-file-name nil t)
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(octave-send-echo-input nil)
 '(octave-send-show-buffer t)
 '(rails-ws:default-server-type "mongrel")
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(set-frame-font "Lucida Console-9")

(line-number-mode 1)
(column-number-mode 1)
(setq-default indent-tabs-mode nil) 

(setq load-path (cons "~/.emacs.d/rails" load-path))
(require 'rails)

(add-to-list 'load-path "~/.emacs.d/textmate")
(require 'textmate)
(textmate-mode)

(setq load-path (cons "~/.emacs.d/site-lisp" load-path))
(require 'magit)

(add-to-list 'load-path "~/.emacs.d/rdebug")
(require 'rdebug)

(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")

;; cucumber mode
(add-to-list 'load-path "~/.emacs.d/feature-mode")
(setq feature-default-language "en")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; yaml mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; js2 mode
(add-to-list 'load-path "~/.emacs.d/js2-mode")
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
     
;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; Interactively Do Things (highly recommended)
(require 'ido)
(ido-mode t)

;; Color theme
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-select 'color-theme-black-on-gray)

;; Customizations
(put 'scroll-left 'disabled nil)

(global-set-key [f12] 'magit-status)
(global-set-key (kbd "C-c C-v") 'rinari-find-view)

(defun pull-next-line()
  "Pull the next line onto the end of the current line,
   compressing whitespace. (http://bit.ly/BnYG5)"
  (interactive) 
  (move-end-of-line 1) 
  (kill-line)
  (just-one-space))
(global-set-key (kbd "M-J") 'pull-next-line)

(defun duplicate-line()
  "Duplicate current line. (http://bit.ly/3RXxq)"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-c C-w") 'duplicate-line)
(global-set-key "\C-c\C-q" "\M-m\C- \C-e\M-w\M-m")

(global-set-key "\C-[\C-j" "\C-e\C-m\C-i")

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(fset 'refresh-from-file
   "\C-xrma\C-m\C-x\C-v\C-m\C-xrba\C-m")

(add-to-list 'load-path "~/.emacs.d/ochko")
(require 'bubble-buffer)
(global-set-key [f4] 'bubble-buffer-next)
(global-set-key [(shift f4)] 'bubble-buffer-previous)
(setq bubble-buffer-omit-regexp "\\(^ .+$\\|\\*Messages\\*\\|*scratch\\*\\|\\*Completions\\*\\|\\*Occur\\*\\|\\*magit*\\)")

;; Haml mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

(put 'dired-find-alternate-file 'disabled nil)

