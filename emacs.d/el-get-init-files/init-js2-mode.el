(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)
(setq js2-mirror-mode nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

(setq grunt-cmd "grunt --no-color --gruntfile ~/mobile/yeoman/Gruntfile.js devBuild")

(defun grunt ()
  "Run grunt"
  (interactive)
  (let* ((grunt-buffer (get-buffer-create "*grunt*"))
        (result (call-process-shell-command grunt-cmd nil grunt-buffer t))
        (output (with-current-buffer grunt-buffer (buffer-string))))
    (cond ((zerop result)
           (message "Grunt completed without errors"))
          (t
           (message nil)
           (split-window-vertically)
           (set-window-buffer (next-window) grunt-buffer)))))

(setq safari-cmd "osascript ~/scripts/SafariDevelopMenu.scpt 'iPhone Simulator'")
(defun safari-dev-menu ()
  "Open safari dev menu"
  (interactive)
  (let* ((safari-buffer (get-buffer-create "*safari*"))
        (result (call-process-shell-command safari-cmd nil safari-buffer t))
        (output (with-current-buffer safari-buffer (buffer-string))))
    (cond ((zerop result)
           (message "Safari developer menu launched without errors"))
          (t
           (message nil)
           (split-window-vertically)
           (set-window-buffer (next-window) safari-buffer)))))

(add-hook 'js2-mode-hook
          (lambda ()
            (flycheck-mode t)
            (local-set-key (kbd "RET") 'newline-and-indent)
            (local-set-key (kbd "C-c C-b") 'grunt)
            (local-set-key (kbd "C-c C-s") 'safari-dev-menu)
            (js2-imenu-extras-mode)
            (imenu-add-menubar-index)))
