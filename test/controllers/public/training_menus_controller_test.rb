require "test_helper"

class Public::TrainingMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_training_menus_new_url
    assert_response :success
  end

  test "should get index" do
    get public_training_menus_index_url
    assert_response :success
  end

  test "should get show" do
    get public_training_menus_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_training_menus_edit_url
    assert_response :success
  end
end
