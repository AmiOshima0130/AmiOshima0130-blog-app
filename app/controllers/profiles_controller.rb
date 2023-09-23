class ProfilesController < ApplicationController
  before_action :authenticate_user!#ログインしているユーザーのみ操作できる
  
  def show
    @profile = current_user.profile
  end

  def edit
  end
end