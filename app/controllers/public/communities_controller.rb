class Public::CommunitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :permits]
  
  def new
    @community = Community.new  
  end
  
  def index
    @community_post = CommunityPost.new
    @communities = Community.all
    @user = User.find(current_user.id)
  end
  
  def show
    @community_post = CommunityPost.new
    @community_posts = CommunityPost.all
    @community = Community.find(params[:id])
    @community_post.user_id = current_user.id
  end
  
  def create
    @community = Community.new(community_params)
    @community.owner_id = current_user.id
    if @community.save
      redirect_to communities_path, flash: {success: "コミュニティの作成に成功しました"}
    else
      render 'new', flash: {danger: "コミュニティの作成に失敗しました"}
    end
  end
  
  def edit
    @community = Community.find(params[:id])
  end
  
  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      redirect_to communities_path, flash: {success: "コミュニティの編集に成功しました"}
    else
      render 'edit', flash: {danger: "コミュニティの編集に失敗しました"}
    end
  end
  
  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to communities_path, flash: {danger: "コミュニティを削除しました"}
  end
  
  def permits
    @community = Community.find(params[:id])
    @permits = @community.permits.page(params[:page])
  end
  
  private
  
  def community_params
    params.require(:community).permit(:name, :introduction, :community_image)
  end
  
  def ensure_correct_user
    @community = Community.find(params[:id])
    unless @community.owner_id ==current_user.id
      redirect_to community_path(@community), alert: "オーナーのみ編集が可能です"
    end
  end
end
