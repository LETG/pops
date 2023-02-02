config.paths['app/views'].unshift(FoundationTheme::Engine.root.join('app', 'views'))
config.paths['app/views'].unshift(PopsRedmineEngine::Engine.root.join('app', 'views'))

config.assets.enabled = false

# Configuration Zeitwerk
Rails.autoloaders.main.ignore("#{config.root}/lib/generators/**/*.rb")
Rails.autoloaders.main.ignore("#{config.root}/plugins/**/lib/generators/**/*.rb")
Rails.autoloaders.main.ignore("#{config.root}/**/*_decorator.rb")

config.autoload_paths += %W(#{config.root}/lib)

config.railties_order = [:main_app, FoundationTheme::Engine, PopsRedmineEngine::Engine, :all]

config.to_prepare do
  # Load external decorators
  Dir.glob(File.join(File.dirname(__FILE__), "../engines/**/lib/**/*_decorator*.rb")).sort.each do |c|
    Rails.configuration.cache_classes ? require(c) : load(c)
  end
end