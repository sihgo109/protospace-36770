class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pusername = current_user.username
    @prototypes = current_user.prototypes
  end
end