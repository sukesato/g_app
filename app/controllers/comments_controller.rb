class CommentsController < ApplicationController
  
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
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end
  
  def edit
  end


  
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
  
end
