# Install rspec to rails project

reference https://github.com/rspec/rspec-rails

```
# Gemfile

group :test do
  gem 'rspec-rails', '~> 4.0.1'
end
```

Generate rspec into rails project

```
rails generate rspec:install
```

# Unit test for controller

## References:
- https://relishapp.com/rspec/rspec-rails/docs/controller-specs
- https://relishapp.com/rspec/rspec-rails/v/4-0/docs/view-specs

## Generate rspec test for `users_controller` with `new` and `create` action, and for view

```
rails g rspec:controller Users new create --controller-specs --no-request-specs
```
