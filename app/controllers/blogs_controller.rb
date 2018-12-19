class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    #ビューにテーブルから取得した全てのブログデータを渡す（インスタンス変数を定義）
    # @blogs = Blog.all kaminari使用前
    @blogs = Blog.where(user_id:current_user.id).page(params[:page]).per(3)
    @index_title = "投稿"
  end
  
  def filter
     #インスタンス変数3種類に入れる。ソートの種類ごとに
    @high_blog = Blog.where(priority: 0).where(user_id:current_user.id).page(params[:page]).per(3)
    if params[:id] == "A"
      @blogs = @high_blog
      @index_title = "優先度Aの投稿"
      render 'index'
    elsif params[:id] == "B"
      @middle_blog= Blog.where(priority: 1).where(user_id:current_user.id).page(params[:page]).per(3)
      @blogs = @middle_blog
      @index_title = "優先度Bの投稿"
      render 'index'
    elsif params[:id] == "C"
      @low_blog = Blog.where(priority: 2).where(user_id:current_user.id).page(params[:page]).per(3)
      @blogs = @low_blog
      @index_title = "優先度Cの投稿"
      render 'index'
    elsif params[:id] == "nonfin"
      @nonfin_blog = Blog.where(task_flag: false).where(user_id:current_user.id).page(params[:page]).per(3)
      @blogs = @nonfin_blog
      @index_title = "未完了の投稿"
      render template: "blogs/nf_index"
    elsif params[:id] == "nonfin_A"
      @nonfin_a_blog = Blog.where(priority: 0).where(user_id:current_user.id).where(task_flag: false).page(params[:page]).per(3)
      @blogs = @nonfin_a_blog
      @index_title = "優先度Aで未完了の投稿"
      render template: "blogs/nf_index"
    elsif params[:id] == "nonfin_B"
      @nonfin_b_blog = Blog.where(priority: 1).where(user_id:current_user.id).where(task_flag: false).page(params[:page]).per(3)
      @blogs = @nonfin_b_blog
      @index_title = "優先度Bで未完了の投稿"
      render template: "blogs/nf_index"
    elsif params[:id] == "nonfin_C"
      @nonfin_c_blog = Blog.where(priority: 2).where(user_id:current_user.id).where(task_flag: false).page(params[:page]).per(3)
      @blogs = @nonfin_c_blog
      @index_title = "優先度Cで未完了の投稿"
      render template: "blogs/nf_index"
    end
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
    @blog.user_id = current_user.id #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
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
    @comments = @blog.comments
    @comment = @blog.comments.build
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
    @blog.user_id = current_user.id #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    render :new if @blog.invalid?
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content, :priority, :task_flag) #StrongParameterを使用
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
end
