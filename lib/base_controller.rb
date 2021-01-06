# frozen_string_literal: true

class BaseController
  attr_reader :env, :request, :cookies

  def initialize(env)
    @env = env
    @request = Rack::Request.new(env)
    @cookies = {}
  end

  def render(view)
    render_template('layouts/application') do
      render_template(view)
    end
  end

  def render_template(path, &block)
    Tilt.new(file(path)).render(self, &block)
  end

  def redirect(location)
    [
      [],
      302,
      { 'Location' => location }
    ]
  end

  private

  def file(path)
    Dir[File.join('app', 'views', "#{path}.html.*")].first
  end
end
