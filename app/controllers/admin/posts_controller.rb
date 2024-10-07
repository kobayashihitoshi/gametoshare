class Admin::PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = @post.user
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to "/mypage", flash: {danger: "投稿を削除しました"}
    end
  end
  
end
