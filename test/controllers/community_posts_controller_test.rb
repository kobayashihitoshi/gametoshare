require "test_helper"

class CommunityPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get community_posts_new_url
    assert_response :success
  end

  test "should get show" do
    get community_posts_show_url
    assert_response :success
  end

  test "should get create" do
    get community_posts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get community_posts_destroy_url
    assert_response :success
  end
end
