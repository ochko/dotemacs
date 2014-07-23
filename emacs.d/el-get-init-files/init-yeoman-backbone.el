(setq yeoman-backbone-jump-schema
      '(
        ("spec-c"      . "/\\1Controller.spec.js")
        ("spec-v"      . "/\\1View.spec.js")
        ("spec"        . "/\\1.spec.js")
        ("collection"  . "app/scripts/collections/\\1.js")
        ("controller"  . "app/scripts/controllers/\\1Controller.js")
        ("error"       . "app/scripts/errors/\\1.js")
        ("helper"      . "app/scripts/helpers/\\1.js")
        ("mixin"       . "app/scripts/mixins/\\1.js")
        ("model"       . "app/scripts/models/\\1.js")
        ("renderer"    . "app/scripts/renderers/\\1Renderer.js")
        ("route"       . "app/scripts/routes/\\1.js")
        ("service"     . "app/scripts/services/\\1.js")
        ("template"    . "app/scripts/templates/\\1.js")
        ("translation" . "app/scripts/translations/\\1.js")
        ("assembler"   . "app/scripts/views/components/assemblers/\\1Control.js")
        ("widget"      . "app/scripts/views/components/widgets/\\1Control.js")
        ("component"   . "app/scripts/views/components/\\1.js")
        ("view"        . "app/scripts/views/\\1View.js")
        ("sass"        . "app/styles/sass/\\1.scss")
        ))

(add-hook 'js2-mode-hook
          (lambda ()
            (yeoman-backbone)))