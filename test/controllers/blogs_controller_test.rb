require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blogs_index_url
    assert_response :success
  end

  test "should get create:post" do
    get blogs_create:post_url
    assert_response :success
  end
end
