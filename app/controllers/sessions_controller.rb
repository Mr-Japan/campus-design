class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(sessions_params)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    reditect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    sessions.delete(:user_id)
    @current_user = nill
  end
  
  private
  def sessions_params
    params.require(:user).permit(:email)
  end
  
end
