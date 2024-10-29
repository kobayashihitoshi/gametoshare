class Admin::PostsController < ApplicationController
  layout 'admin'
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = @post.user
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to admin_post_path, flash: {danger: "投稿を削除しました"}
    end
  end
  
end
