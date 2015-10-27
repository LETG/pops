# What is POPS ?

POPS project is a set of additions to Redmine which aims to turn Redmine into a collaborative scientific platform.
This include a focus to documents and project pages plus a full design revamp.

The POPS project is composed of several sub-projects :

* [redmine-pops-engine](https://github.com/LETG/redmine-pops-engine) is an engine you can mount in Redmine to change Redmine design.
* [redmine-pops](https://github.com/LETG/redmine-pops) is a set of changes brought to Redmine for POPS custom use.
* [redmine-invitable](https://github.com/LETG/redmine-invitable) is a plugin allowing you to invite people to join Redmine per project.
* [redmine-documents-pops](https://github.com/LETG/redmine-documents-pops) is a plugin changing how documents behave in Redmine.

# Installation guide

### Dependencies

In order for POPS to work properly, you will need the following installed :

* Ruby 2.1.0 and greater
* Redmine 2.6.x (< 3.0)
* PostgreSQL 9.1 and greater or MySQL
* ImageMagick (imagemagick, libmagickwand-dev)

## Method 1: Install from scratch

* Clone this repository and its submodules

```
$ git clone --recursive https://github.com/LETG/pops.git
```

* Follow the [installation procedure of Redmine](http://www.redmine.org/projects/redmine/wiki/redmineinstall#Installation-procedure)

* Follow the installation procedure of plugins

```
$ rake redmine:plugins:migrate
```

## Method 2: Install in an existing Redmine instance

By its nature, POPS needs to override some Redmine functionnalities.
As such, this will not be a straightforward installation process and knowledge of Rails is highly recommended.

* Download and install all the required plugins

In addition to pops plugins described above, the project also has a couple of additional dependencies.
For the full POPS experience, you need to download and install the followings :

* `redmine_ckeditor` - [Docs](https://github.com/a-ono/redmine_ckeditor)
:warning: With version 1.0.20, if you choose to clone it do it via `git clone https://github.com/a-ono/redmine_ckeditor.git --single-branch -b 1.0.20 --depth 1`
* `redmine_http_auth` - [Docs](https://github.com/kevinfoote/redmine_http_auth)

* Download and install POPS plugins

```bash
$ cd plugins
$ git clone https://github.com/LETG/redmine-pops.git pops_project --depth 1
$ git clone https://github.com/LETG/redmine-invitable.git invitable --depth 1
$ git clone https://github.com/LETG/redmine-documents-pops.git documents_pops --depth 1
```

Then in Redmine root folder, execute the followings

```bash
$ bundle install
$ rake redmine:plugins:migrate
$ rake redmine:pops_project_create_roles
```

Your redmine instance should still be working at this point!

* Install the POPS engine and mount it

```bash
$ mkdir engines && cd engines
$ git clone https://github.com/LETG/redmine-pops-engine.git --depth 1
```

In redmine root directory, create a file called Gemfile.local and add :
```ruby
gem 'pops_redmine_engine', path: 'engines/redmine-pops-engine'
```

In the redmine config/additional_environment.rb, add the following :

```ruby
config.paths['app/views'].unshift(PopsRedmineEngine::Engine.root.join('app', 'views'))
config.paths['app/helpers'].unshift(PopsRedmineEngine::Engine.root.join('app', 'helpers').to_s)
config.paths['lib'].unshift(PopsRedmineEngine::Engine.root.join('lib'))
```

* Install the Foundation Theme engine and mount it

```bash
$ mkdir engines && cd engines
$ git clone https://github.com/dotgee/redmine-foundation-theme.git --depth 1
```

Edit Gemfile.local and add :

```ruby
gem 'foundation_theme', path: 'engines/redmine-foundation-theme'
```

In config/additional_environment.rb, add :

```
config.paths['app/views'].unshift(FoundationTheme::Engine.root.join('app', 'views'))
config.paths['app/helpers'].unshift(FoundationTheme::Engine.root.join('app', 'helpers').to_s)
config.paths['lib'].unshift(FoundationTheme::Engine.root.join('lib'))

config.assets.enabled = true

config.assets.paths << "#{Rails.root}/public/stylesheets/"
config.assets.paths << "#{Rails.root}/public/javascripts/"
config.assets.paths << "#{Rails.root}/public/images/"
```


### Troubleshooting

* Column doesn't exist / Migrations were not run

Plugins folders need to have a specific name for their migrations to be ran. Please make sure they have the name specified in above steps.

### Authors

* [@almerino](https://github.com/almerino)
* [@jchapron](https://github.com/jchapron)
* [@dotgee](https://github.com/dotgee)

### Contributing

POPS is an open source project and we encourage contributions.

In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways **you** can contribute:

* by reporting [bugs](https://github.com/LETG/redmine-pops/issues/new)
* by writing or editing documentation
* by writing [specs](https://github.com/LETG/redmine-pops/labels/specs)
* by writing [needed code](https://github.com/LETG/redmine-pops/labels/code) or [finishing code](https://github.com/LETG/redmine-pops/labels/stalled)
* by [refactoring code](https://github.com/LETG/redmine-pops/labels/performance)
* by resolving [issues](https://github.com/LETG/redmine-pops/issues)
* by reviewing [pull requests](https://github.com/LETG/redmine-pops/pulls)

### Licence

POPS is released under the [GNU GENERAL PUBLIC LICENSE](https://www.gnu.org/licenses/gpl-3.0.html).  See the [`LICENSE.md`](https://github.com/LETG/redmine-pops/blob/master/LICENSE.md) file.
