require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tyler).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned correctly" do
  	get :show, id: users(:tyler).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "that shows the correct user's status" do
    get :show, id: users(:tyler).profile_name
    assigns(:statuses).each do |status|
      assert_equal users(:tyler), status.user
    end
  end

end
