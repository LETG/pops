# CSS
Rails.application.config.assets.precompile += %w( jquery/jquery-ui-1.11.0.css responsive.css context_menu.css scm.css )

# JS
Rails.application.config.assets.precompile += %w( jquery-1.11.1-ui-1.11.0-ujs-3.1.4.js responsive.js i18n/datepicker-fr.js context_menu.js attachments.js raphael.js gantt.js pops_redmine_engine/project_identifier.js )

# Images
Rails.application.config.assets.precompile += %w( timelineJS/fancybox_sprite.png timelineJS/loading.gif timelineJS/blank.gif timelineJS/overlay.png timelineJS/fancybox_sprite@2x.png )
