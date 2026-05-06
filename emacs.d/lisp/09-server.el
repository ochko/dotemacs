;;; 09-server.el --- Emacs server -*- lexical-binding: t -*-

(use-package server
  :ensure nil
  :config
  (unless (server-running-p)
    (server-start)))

(provide '09-server)
