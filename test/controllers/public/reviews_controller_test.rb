require 'test_helper'

class Public::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get public_reviews_index_url
    assert_response :success
  end

  test 'should get new' do
    get public_reviews_new_url
    assert_response :success
  end

  test 'should get create' do
    get public_reviews_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get public_reviews_destroy_url
    assert_response :success
  end
end
