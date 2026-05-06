;; Package system bootstrap (must come first)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; Refresh if a package is missing or not found
;; (package-refresh-contents)

;; use-package setup
(require 'use-package)
(setq use-package-always-ensure t)

(provide '01-package)
