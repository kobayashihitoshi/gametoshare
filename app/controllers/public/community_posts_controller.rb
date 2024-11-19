class Public::CommunityPostsController < ApplicationController
  
  def create
    @community = Community.find(params[:community_post][:community_id])
    @community_posts = @community.community_posts
    @community_post = @community.community_posts.build(community_post_params)
    @community_post.user_id = current_user.id
    if @community_post.save
      redirect_to community_path(@community), flash: {success: "投稿に成功しました"}
    else
      @community_posts = CommunityPost.all
      flash.now[:danger] = "投稿に失敗しました"
      render "/public/communities/show"
    end
  end
  
  def destroy
    @community_post = CommunityPost.find(params[:id])
    if @community_post.user_id == current_user.id
      @community_post.destroy
      redirect_to community_path(@community_post.community_id), flash: {danger: "投稿を削除しました"}
    end
  end
  
  private

  def community_post_params
    params.require(:community_post).permit(:user_id, :community_id, :body)
  end
end