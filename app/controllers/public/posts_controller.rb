class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), flash: {success: "投稿の編集に成功しました"}
    else
      flash.now[:danger] = "投稿の編集に失敗しました"
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), flash: {success: "投稿に成功しました"}
    else
      @user = current_user
      @posts = Post.all
      flash.now[:danger] = "投稿に失敗しました"
      render template: "public/users/show"
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to "/mypage", flash: {danger: "投稿を削除しました"}
    end
  end
  
  private
  
  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to "/mypage"
    end
  end
  
  def post_params
    params.require(:post).permit(:body, :image, :video)
  end
end
