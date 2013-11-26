class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)     #Not final implementation
    if @user.save
      # Handle the succesful save.
    else
      render 'new'
    end
  end

  private

  def user_params # Getting rid of some extra parameters that attackers are using
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
