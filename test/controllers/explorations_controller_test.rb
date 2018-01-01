require 'test_helper'

class ExplorationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exploration = explorations(:one)
  end

  test "should get index" do
    get explorations_url
    assert_response :success
  end

  test "should get new" do
    get new_exploration_url
    assert_response :success
  end

  test "should create exploration" do
    assert_difference('Exploration.count') do
      post explorations_url, params: { exploration: { context: @exploration.context } }
    end

    assert_redirected_to exploration_url(Exploration.last)
  end

  test "should show exploration" do
    get exploration_url(@exploration)
    assert_response :success
  end

  test "should get edit" do
    get edit_exploration_url(@exploration)
    assert_response :success
  end

  test "should update exploration" do
    patch exploration_url(@exploration), params: { exploration: { context: @exploration.context } }
    assert_redirected_to exploration_url(@exploration)
  end

  test "should destroy exploration" do
    assert_difference('Exploration.count', -1) do
      delete exploration_url(@exploration)
    end

    assert_redirected_to explorations_url
  end
end
