class UsersController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  #ユーザ作成
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.contact_mail(@contact).deliver
      # 保存の成功した場合の処理
      redirect_to user_path(@user.id), notice: "ユーザーを作成しました！"
    else
      render 'new'
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
  
  
  
 
