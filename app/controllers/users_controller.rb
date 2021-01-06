# frozen_string_literal: true

class UsersController < BaseController
  def index
    @users = User.all
    render('users/index')
  end

  def new
    @user = User.new
    render('users/new')
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome(@user).deliver
      redirect('/')
    else
      render('users/new')
    end
  end

  private

  def user_params
    request.params['user']
  end
end
