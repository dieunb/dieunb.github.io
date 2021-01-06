# frozen_string_literal: true

$LOAD_PATH << '.'

require 'config/environment'

use Rack::Reloader, 0
use Rack::Static, root: 'public',
                  urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
use Router do
  get '/users' => 'users#index'
  get '/sign_up' => 'users#new'
  post '/sign_up' => 'users#create'
  get '/sign_in' => 'sessions#new'
  post '/sign_in' => 'sessions#create'
end

run Application
