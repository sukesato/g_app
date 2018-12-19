class CommentsController < ApplicationController
   before_action :set_comment, only: [:edit, :update, :destroy]
  
  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    @comment.user_id = current_user.id #現在ログインしているuserのidを、commentのuser_idカラムに挿入する
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog), notice: '投稿できませんでした...' }
      end
    end
  end
  
  def destroy
    #binding.pry
    if @comment.destroy
      redirect_to blog_path(@comment.blog), notice:"コメントを削除しました！"
    end
  end
  
  def edit
    @blog = Blog.find(params[:blog_id])
  end

  def update
    # @comment = Comment.find(params[:id])
    @blog = Blog.find(params[:blog_id])
    if @comment.update(comment_params)
      redirect_to blog_path(@blog.id), notice: "投稿内容を編集しました！"
    else
      render 'edit'
    end
    # render :index if @comment.update(comment_params)
  end
  
  private
  
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
end
