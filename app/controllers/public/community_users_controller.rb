class Public::CommunityUsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @community = Community.find(params[:community_id])
    @permit = Permit.find(params[:permit_id])
    @community_user = CommunityUser.create(user_id: @permit.user_id, community_id: params[:community_id])
    @permit.destroy 
    redirect_to request.referer
  end
  
  def destroy
    community_user = current_user.community_users.find_by(community_id: params[:community_id])
    community_user.destroy
    redirect_to communities_path, flash: {danger: "コミュニティから退会しました"}
  end
end
