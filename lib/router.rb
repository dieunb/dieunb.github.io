# frozen_string_literal: true

class Router
  attr_reader :app, :routes

  # ROUTES = {
  #  '/' => 'users#index' # controller: users, action: index
  # }.freeze

  def initialize(app, &block)
    @app = app
    @routes = [
      {
        request_path: '/',
        request_method: 'get',
        to: 'welcomes#index'
      }
    ]
    instance_eval(&block) if block_given?
  end

  def call(env)
    request_method = env['REQUEST_METHOD'].downcase
    request_path = env['PATH_INFO']

    route = routes.find do |r|
      r[:request_method] == request_method &&
        r[:request_path] == request_path
    end

    if route
      env.merge!(controller_action(route[:to]))
      app.call(env)
    else
      Rack::Response.new('Not found', 404)
    end
  end

  def controller_action(mapping)
    Hash[%w[controller action].zip mapping.split('#')]
  end

  def match(route)
    get(route)
    post(route)
  end

  def get(route)
    route = route.first
    routes.push(
      request_path: route[0],
      request_method: 'get',
      to: route[1]
    )
  end

  def post(route)
    route = route.first
    routes.push(
      request_path: route[0],
      request_method: 'post',
      to: route[1]
    )
  end
end
