# frozen_string_literal: true

$LOAD_PATH << File.expand_path('.')
$LOAD_PATH << File.expand_path('.', 'lib')

require 'dotenv/load'
Dotenv.load('.env.development')

require 'byebug' if %w[development test].include?(ENV['APP_ENV'] || 'development')

require 'rack'
require 'tilt'
require 'erb'
require 'active_record'
require 'action_mailer'

ActiveRecord::Base.logger = Logger.new(STDOUT)

autoload :Router, 'lib/router'
autoload :Application, 'lib/application'
autoload :BaseController, 'lib/base_controller'

require 'config/database'
require 'config/smtp'

require 'app/validators/category_validator'

Dir[File.join('app', 'mails', '*')].each do |mail_file_path|
  require mail_file_path
end

Dir[File.join('app', 'models', '*')].each do |model_file_path|
  require model_file_path
end

Dir[File.join('app', 'helpers', '*')].each do |helper_file_path|
  require helper_file_path
end

Dir[File.join('app', 'controllers', '*')].each do |controller_file_path|
  require controller_file_path
end

