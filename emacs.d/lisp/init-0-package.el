;;; init-0-package.el --- Package setup

;; Package system bootstrap (must come first)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package setup
(require 'use-package)
(setq use-package-always-ensure t)

(provide 'init-0-package)
;;; init-0-package.el ends here
