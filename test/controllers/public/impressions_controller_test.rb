require "test_helper"

class Public::ImpressionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_impressions_new_url
    assert_response :success
  end

  test "should get index" do
    get public_impressions_index_url
    assert_response :success
  end

  test "should get show" do
    get public_impressions_show_url
    assert_response :success
  end
end
