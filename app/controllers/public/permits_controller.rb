class Public::PermitsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @community = Community.find(params[:community_id])
    permit = current_user.permits.new(community_id: params[:community_id])
    permit.save
    redirect_to request.referer, flash: {success: "グループへの参加を申請しました"}
  end
  
  def destroy
    permit = current_user.permits.find_by(community_id: params[:community_id])
    permit.destroy
    redirect_to request.referer, flash: {danger: "グループへの参加申請を取り消しました"}
  end
  
end
