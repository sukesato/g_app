class LabelsController < ApplicationController
   #blogとpriorityの中間テーブルとして使用
  
  #ラベルを添付するだけ
  
  def create
    label = current_user.labels.create(blog_id: params[:blog_id])
  end

  def destroy
    label = current_user.labels.find_by(id: params[:id]).destroy
  end
end
