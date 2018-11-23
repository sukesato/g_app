class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  
  
  
  def index
    #ビューにテーブルから取得した全てのブログデータを渡す（インスタンス変数を定義）
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      # 一覧画面へ遷移して"新規投稿を行いました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "新規投稿を行いました！"
    else
      # 処理終了後に呼び出されるビューがnew.html.erbに変更される
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿内容を編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"投稿を削除しました！"
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    # @blog.user_id = current_user.id #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    render :new if @blog.invalid?
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content, :priority) #StrongParameterを使用
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  
end
