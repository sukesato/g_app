class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
     @user = User.find(params[:id])
  end
  
  #ユーザ作成
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.user_mail(@user).deliver
      # 保存の成功した場合の処理
      redirect_to user_path(@user.id), notice: "ユーザーを作成しました！"
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).
    permit(:name, :email, :password, :password_confirmation, :profile_image, :profile_image_cache )
  end
end
  
  
  
 
