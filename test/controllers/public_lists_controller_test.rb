require 'test_helper'

class PublicListsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get public_lists_index_url
    assert_response :success
  end
end
