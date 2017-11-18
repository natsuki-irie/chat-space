class MessagesController < ApplicationController
  before_action :move_to_sign_up

  def index
  end

  private
  def move_to_sign_up
     redirect_to "/users/sign_up" unless user_signed_in?
  end
end
