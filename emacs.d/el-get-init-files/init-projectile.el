;;(projectile-global-mode)
(projectile-mode +1)
(setq projectile-completion-system 'ido)
(setq projectile-enable-caching t)
(setq projectile-remember-window-configs t)
(setq projectile-switch-project-action 'projectile-find-file)
(setq projectile-find-dir-includes-top-level t)
(setq projectile-project-search-path '("~/projects" "~/apps" "~/src"))

;; Ruby + Rake + Minitest
(projectile-register-project-type 'ruby-rake-test '("Rakefile" "lib" "test")
                                  :compile "rake"
                                  :src-dir "lib/"
                                  :test "rake test")

;; Rails gems
(projectile-register-project-type 'rails-gem '("CHANGELOG.md" "MIT-LICENSE" "lib")
                                  :src-dir "lib/")
