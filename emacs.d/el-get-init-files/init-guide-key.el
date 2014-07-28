;; https://github.com/kbkbkbkb1/guide-key

;; delay in seconds to show guide
(setq guide-key/idle-delay 0.5)

(setq guide-key/popup-window-position 'bottom)

;; check key sequence recursively
(setq guide-key/guide-key-sequence '("C-x" "C-c" "ESC t" "ESC g"))
(setq guide-key/recursive-key-sequence-flag t)
;; if recursive check is slow/big, narrow key combinations
;; (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c !" "C-c f" "C-c ,"))

(guide-key-mode 1)
