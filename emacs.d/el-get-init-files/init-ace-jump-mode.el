(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

;; disable grey background
(setq ace-jump-mode-gray-background nil)

;; jump only current window
(setq ace-jump-mode-scope 'window)

;; use numbers and alphabets
(setq ace-jump-mode-move-keys
      (nconc (loop for i from ?a to ?z collect i)
             (loop for i from ?0 to ?9 collect i)
             (loop for i from ?A to ?Z collect i)))
