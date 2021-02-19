class Admin::SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to admin_topics_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
end