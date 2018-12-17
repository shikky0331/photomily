class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "会員情報を登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.fint(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "会員情報を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to pictures_path, notice: '会員情報を削除しました'
  end

  private

    def user_params
      params.require(:user).permit(:name, :login_id, :password, :password_confirmation)
    end

end
