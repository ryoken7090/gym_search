class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @facilities = @user.facilities
  end
end
