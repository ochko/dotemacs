;;; my-functions.el --- Personal editing helpers -*- lexical-binding: t -*-

;; ---------------------------------------------------------------------------
;; Line manipulation
;; ---------------------------------------------------------------------------

(defun my/open-line-below-and-indent ()
  "Open a new line below the current and indent."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun my/copy-current-line ()
  "Copy the current line into the kill ring."
  (interactive)
  (save-excursion
    (back-to-indentation)
    (kill-ring-save (point) (line-end-position))))

(defun my/pull-next-line ()
  "Pull the next line onto the end of the current line, collapsing whitespace."
  (interactive)
  (delete-indentation t))

(defun my/insert-line-above ()
  "Insert a blank line above the current line and place point on it."
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun my/insert-line-below ()
  "Insert a blank line below the current line and place point on it."
  (interactive)
  (end-of-line)
  (newline-and-indent))

;; ---------------------------------------------------------------------------
;; Copy / save lines
;; ---------------------------------------------------------------------------

(defun my/copy-to-end-of-line ()
  "Copy from point to end of line into the kill ring."
  (interactive)
  (kill-ring-save (point) (line-end-position))
  (message "Copied to end of line"))

(defun my/copy-whole-lines (n)
  "Copy N whole lines starting from current line into the kill ring."
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (1+ n)))
  (message "%d line%s copied" n (if (= 1 n) "" "s")))

(defun my/copy-line (arg)
  "Copy to end of line; with prefix ARG, copy ARG whole lines."
  (interactive "P")
  (if (null arg)
      (my/copy-to-end-of-line)
    (my/copy-whole-lines (prefix-numeric-value arg))))

(defun my/save-region-or-current-line (arg)
  "Save region if active, otherwise copy current line.
With prefix ARG, copy ARG whole lines."
  (interactive "P")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (my/copy-line arg)))

;; ---------------------------------------------------------------------------
;; Replace
;; ---------------------------------------------------------------------------

(defun my/replace-regexp-in-region (beg end)
  "Run `replace-regexp' restricted to the region from BEG to END."
  (interactive "*r")
  (save-excursion
    (save-restriction
      (let ((regexp      (read-string "Regexp: "))
            (replacement (read-string "Replacement: ")))
        (narrow-to-region beg end)
        (goto-char (point-min))
        (while (re-search-forward regexp nil t)
          (replace-match replacement nil nil))))))

(defun my/query-replace-in-open-buffers (from-string to-string)
  "Run `query-replace' across every file-visiting buffer."
  (interactive "sQuery replace in open buffers: \nsReplace with: ")
  (dolist (buf (buffer-list))
    (when (buffer-file-name buf)
      (with-current-buffer buf
        (save-excursion
          (goto-char (point-min))
          (query-replace from-string to-string))))))

;; ---------------------------------------------------------------------------
;; Buffer queries and navigation
;; ---------------------------------------------------------------------------

(defun my/buffers-with-major-mode (mode)
  "Return a list of buffers whose major mode is MODE."
  (seq-filter (lambda (buf)
                (eq (buffer-local-value 'major-mode buf) mode))
              (buffer-list)))

(defun my/switch-to-last-buffer ()
  "Switch to the most recently visited buffer."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun my/reload-file-keep-point ()
  "Reload current file from disk, preserving point."
  (interactive)
  (let ((bookmark-name (format "_reload_%s" (buffer-name))))
    (unwind-protect
        (progn
          (bookmark-set bookmark-name)
          (revert-buffer t t)
          (bookmark-jump bookmark-name))
      (ignore-errors (bookmark-delete bookmark-name)))))

;; ---------------------------------------------------------------------------
;; Paragraph manipulation
;; ---------------------------------------------------------------------------

(defun my/unfill-region (beg end)
  "Join paragraphs in region BEG to END into single logical lines."
  (interactive "*r")
  (let ((fill-column most-positive-fixnum))
    (fill-region beg end)))

(provide '02-my-functions)
