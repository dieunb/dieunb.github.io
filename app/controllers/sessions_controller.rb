# frozen_string_literal: true

class SessionsController < BaseController
  include SessionHelper

  def new
    @user = User.new
    render 'sessions/new'
  end

  def create
    @user = User.find_by email: session_params['email'].downcase

    if @user
      sign_in @user
      redirect('/')
    else
      render 'sessions/new'
    end
  end

  private

  def session_params
    request.params['session']
  end
end
