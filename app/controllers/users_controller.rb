class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    before_save :lowercase_email

    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def lowercase_email
    self.email.downcase
  end
end
