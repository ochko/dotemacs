;;; Ruby editing setup -*- lexical-binding: t -*-

(use-package ruby-ts-mode
  :ensure nil   ; built-in
  :mode (("\\.\\(rb\\|rake\\|ru\\|gemspec\\|jbuilder\\)\\'" . ruby-ts-mode)
         ("/\\(Capfile\\|Gemfile\\|Guardfile\\|Rakefile\\|Dangerfile\\|Kaiserfile\\|Brewfile\\|Vagrantfile\\|Berksfile\\|Podfile\\)\\'" . ruby-ts-mode))
  :hook (ruby-ts-mode . superword-mode)
  :custom
  (ruby-insert-encoding-magic-comment nil))

(use-package yaml-ts-mode
  :ensure nil
  :mode ("\\.ya?ml\\'")
  :custom (yaml-indent-offset 2))

(defun my/ensure-ruby-scratch ()
  "Create *ruby-scratch* in the background, without switching to it."
  (let ((buf (get-buffer-create "*ruby-scratch*")))
    (with-current-buffer buf
      (unless (derived-mode-p 'ruby-mode)
        (ruby-mode)))))

(add-hook 'after-init-hook #'my/ensure-ruby-scratch)

(provide '42-ruby)
