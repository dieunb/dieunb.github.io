# Environment

An environment variable is a dynamic-named value that can affect the way running processes will behave on a computer.

In all Unix and Unix-like systems, each process has its own separate set of environment variables. By default, when a process is created, it inherits a duplicate environment of its parent process, except for explicit changes made by the parent when it creates the child

- Bash (Bourne-Again SHell)
https://www.linuxjournal.com/content/understanding-bash-elements-programming

- print your home directory
```
echo $HOME
```

- export an environment (bash shell only)
```
VARIABLE=value
export VARIABLE
echo $VARIABLE
```

or
```
export VARIABLE=value
```

## Using ENV in project

- Set database DATABASE_USER_NAME, DATABASE_PASSWORD or DATABSE_URL

```
# .bashrc

export DATABASE_USER_NAME='demo'
export DATABASE_PASSWORD='123456'
export DATABSE_URL='your_value'
```


## Working ENV with ruby / rails project

Using some gems to set environment
https://www.honeybadger.io/blog/ruby-guide-environment-variables/

### Figaro
https://github.com/laserlemon/figaro

```
# Gemfile
...
gem "figaro"
...
```

```
bundle
```

```
# config/application.yml

DATABASE_USER_NAME: 'demo'
DATABASE_PASSWORD: '123456'
DATABSE_URL: 'your_value'
```

### Dotenv
https://github.com/bkeepers/dotenv

```
# Gemfile
...
gem 'dotenv'
...
```

```
bundle install
```

```
require 'dotenv/load'

# or
require 'dotenv'
Dotenv.load
```

```
# .env.development
# .env.test

DATABASE_USER_NAME='demo'
DATABASE_PASSWORD='123456'
DATABSE_URL='your_value'
```
