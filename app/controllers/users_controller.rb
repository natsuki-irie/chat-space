class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_update_params)
    redirect_to "/users/sign_up"
  end


  private
  def user_update_params
     params.require(:user).permit(:name, :email)
  end
end
