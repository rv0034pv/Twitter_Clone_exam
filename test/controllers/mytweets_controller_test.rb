require 'test_helper'

class MytweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get mytweets_new,_url
    assert_response :success
  end

  test "should get edit,show," do
    get mytweets_edit,show,_url
    assert_response :success
  end

  test "should get index" do
    get mytweets_index_url
    assert_response :success
  end

end
