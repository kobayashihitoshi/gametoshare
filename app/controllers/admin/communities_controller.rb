class Admin::CommunitiesController < ApplicationController
  layout 'admin'
  
  
  def index
    @communities = Community.all
  end
  
  def show
    @communities = Community.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def create
    @community = Community.new(community_params)
    @community.admin_id = current_admin.id
    if @community.save
      redirect_to admin_communities_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @community.update(community_params)
      redirect_to admin_communities_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to admin_communities_path, flash: {danger: "コミュニティを削除しました"}
  end
  
  private
  
  def community_params
    params.require(:community).permit(:name, :introduction, :community_image)
  end
  
end
