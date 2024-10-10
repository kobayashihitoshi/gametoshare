class Admin::PostsController < ApplicationController
  layout 'admin'
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to "/mypage", flash: {danger: "投稿を削除しました"}
    end
  end
  
end
