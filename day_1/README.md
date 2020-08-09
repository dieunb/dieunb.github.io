# Init rails project

```
rails new eshop -d postgresql -T --skip-webpack-install --skip-javascript
```

# Patch to work without webpack

- Create app/assets/javascripts/application.js and add the following lines to it

```
# app/assets/javascripts/application.js

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
bundle add bootstrap
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

- Sign up -> UsersController#new and UsersController#create
- Sign in -> SessionsController#new and SessionsController#create
- Sign out -> SessionsController#destroy

# View

- views/users/new.html.erb
- views/sessions/new.html.erb

# Using devise gem

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
