# frozen_string_literal: true

class WelcomesController < BaseController
  def index
    render('welcomes/index')
  end
end
