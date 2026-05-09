;; Package system bootstrap -*- lexical-binding: t -*-
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; Refresh if a package is missing or not found
;; (package-refresh-contents)

;; use-package setup
(require 'use-package)
(setq use-package-always-ensure t)

;; Diminished modes are minor modes with no modeline display
;; use-packaged packages use :diminish keyword at their declaration.
;; built-in's with no use-package diminished here.
(use-package diminish
  :ensure t
  :config
  (with-eval-after-load 'autorevert (diminish 'auto-revert-mode))
  (with-eval-after-load 'subword    (diminish 'subword-mode)
                                    (diminish 'superword-mode)))

(provide '01-package)
