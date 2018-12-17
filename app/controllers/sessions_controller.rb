class SessionsController < ApplicationController
  def new
  end

  def create
    @user=User.find_by(login_id: session_params[:login_id])

    if @user&.authenticate(session_params[:password])
      session[:user_id]=user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      flash.now[:notice] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

    def session_params
      params.require(:session).permit(:login_id, :password)
    end

end
