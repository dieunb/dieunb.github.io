# Devise gem

```
# Gemfile and then bundle install
gem 'devise'

# or using bundle
bundle add devise
```

Get started by following its guide https://github.com/heartcombo/devise#getting-started

for short

```
rails generate devise:install
```

```
# config/environments/development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

```
# rails generate devise MODEL
rails generate devise User
```
