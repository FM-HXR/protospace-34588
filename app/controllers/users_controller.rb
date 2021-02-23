class UsersController < ApplicationController
  before_action :find_user
  def show
    @user = User.find(params[:id])
  end
end
