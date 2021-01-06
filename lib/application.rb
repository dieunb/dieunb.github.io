# frozen_string_literal: true

class Application
  class << self
    attr_accessor :env

    def call(env)
      self.env = env

      response = Rack::Response.new(*dispath)
      response
    end

    private

    def dispath
      controller.new(env).public_send(env['action'])
    end

    def controller
      Object.const_get(env['controller'].capitalize + 'Controller')
    end
  end
end
