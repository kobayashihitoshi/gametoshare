class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @user = current_user
      @posts = Post.all
      render template: "users/show"
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to "/mypage"
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, :image, :video)
  end
end
