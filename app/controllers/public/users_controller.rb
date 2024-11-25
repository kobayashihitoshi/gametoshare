class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :is_matching_login_user, only: [:edit, :update]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(5)
  end
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), flash: {success: "編集しました"}
    else
      flash.now[:danger] = "失敗しました"
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, flash: {danger: "退会しました"}
    else
      flash.now[:danger] = "失敗しました"
      render :edit
    end
  end

  private
  
  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to "/mypage"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end