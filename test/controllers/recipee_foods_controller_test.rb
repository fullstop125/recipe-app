require 'test_helper'

class RecipeeFoodsControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    get recipee_foods_edit_url
    assert_response :success
  end

  test 'should get new' do
    get recipee_foods_new_url
    assert_response :success
  end

  test 'should get create' do
    get recipee_foods_create_url
    assert_response :success
  end
end
