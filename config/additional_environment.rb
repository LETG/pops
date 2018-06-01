config.paths['app/views'].unshift(FoundationTheme::Engine.root.join('app', 'views'))
# config.paths['app/helpers'].unshift(FoundationTheme::Engine.root.join('app', 'helpers').to_s)
# config.paths['lib'].unshift(FoundationTheme::Engine.root.join('lib'))
config.paths['app/views'].unshift(PopsRedmineEngine::Engine.root.join('app', 'views'))
# config.paths['app/helpers'].unshift(PopsRedmineEngine::Engine.root.join('app', 'helpers').to_s)
# config.paths['lib'].unshift(PopsRedmineEngine::Engine.root.join('lib'))

# config.paths['lib'] << PopsRedmineEngine::Engine.root.join('lib')
# config.paths['app/helpers'] << PopsRedmineEngine::Engine.root.join('app', 'helpers').to_s
# config.paths['app/views'] << PopsRedmineEngine::Engine.root.join('app', 'views')
# config.paths['lib'] << FoundationTheme::Engine.root.join('lib')
# config.paths['app/helpers'] << FoundationTheme::Engine.root.join('app', 'helpers').to_s
# config.paths['app/views'] << FoundationTheme::Engine.root.join('app', 'views')

config.assets.enabled = true

config.assets.paths << "#{Rails.root}/public/stylesheets/"
config.assets.paths << "#{Rails.root}/public/javascripts/"
config.assets.paths << "#{Rails.root}/public/images/"
