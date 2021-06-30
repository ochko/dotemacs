(projectile-rails-global-mode)

(setq projectile-rails-add-keywords nil)
(setq projectile-rails-server-mode-ansi-colors nil)
(setq projectile-rails-vanilla-command "bin/rails"
      projectile-rails-spring-command "bin/spring"
      projectile-rails-zeus-command "bin/zeus")

(add-hook 'projectile-mode-hook 'projectile-rails-on)
