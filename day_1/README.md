# Install RVM and Ruby/Rails

By following https://rvm.io/rvm/install to install rvm

for short
```
curl -sSL https://get.rvm.io | bash -s stable
```

Install ruby 2.7.0

```
rvm install ruby-2.7.0
rvm use ruby-2.7.0 --default
```

Install bundler / rails

```
gem install bundler
gem install rails
```

# Init Rails project without webpack

```
rails new eshop -d postgresql -T --skip-webpack-install --skip-javascript
```

# Patch to work without webpack

- Create app/assets/javascripts/application.js and add the following lines to it

```
# app/assets/javascripts/application.js
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_self

```

- Declare javascripts folder to manifest.js

```
# app/assets/config/manifest.js
...
//= link_directory ../javascripts .js
```

- Add `application.js` to `application.html.erb` layout
```
<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
```

- Add some missings gems and configure them in project
```
bundle add turbolinks
bundle add jquery-rails
```

```
cd eshop
```

# User authentication

- User sign up => create a new user
- User sign in => set cookies
- User sign out => delete cookies

# User authentication advance

- Account activation via email
- Forgot password

# Model

```
User(id, name, email, password_digest)

rails generate model User email:string name:string password_digest:string
```

# Controller

- Sign up -> `UsersController#new` and `UsersController#create`
- Sign in -> `SessionsController#new` and `SessionsController#create`
- Sign out -> `SessionsController#destroy`

# View

- views/users/new.html.erb
- views/sessions/new.html.erb

# Using devise gem
https://github.com/heartcombo/devise

```
# Gemfile
...
gem 'devise'
...
```

install new gem
```
bundle install
```
