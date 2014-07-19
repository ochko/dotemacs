;; Push mark when using ido-imenu
;;
;; http://emacsrocks.com/e10.html
;; https://gist.github.com/magnars/2350388

(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

(defun ido-imenu-push-mark ()
  (interactive)
  (let ((push-mark-before-goto-char t))
    (ido-imenu)))
