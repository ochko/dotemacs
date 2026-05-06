;;; Ruby editing setup -*- lexical-binding: t -*-

(use-package ruby-mode
  :ensure nil   ; built-in
  :mode (("\\.\\(rb\\|rake\\|ru\\|gemspec\\|jbuilder\\)\\'" . ruby-mode)
         ("/\\(Capfile\\|Gemfile\\|Guardfile\\|Rakefile\\|Dangerfile\\|Kaiserfile\\|Brewfile\\|Vagrantfile\\|Berksfile\\|Podfile\\)\\'" . ruby-mode))
  :hook (ruby-mode . superword-mode)
  :custom
  (ruby-insert-encoding-magic-comment nil))

(defun my/ensure-ruby-scratch ()
  "Create *ruby-scratch* in the background, without switching to it."
  (let ((buf (get-buffer-create "*ruby-scratch*")))
    (with-current-buffer buf
      (unless (derived-mode-p 'ruby-mode)
        (ruby-mode)))))

(add-hook 'after-init-hook #'my/ensure-ruby-scratch)

(provide '45-ruby)
