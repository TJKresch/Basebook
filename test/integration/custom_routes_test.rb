require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
	test "that /login route opens the login page" do
		get '/login'
		assert_response :success
	end
	test "that /logout route opens the logout page" do
		get '/logout'
		assert_response :redirect
		assert_redirected_to '/'
	end
	test "that /register route opens the register page" do
		get '/register'
		assert_response :success
	end

	test "That /[profile_name] displays a user's profile page" do
		get '/TJKresch'
		assert_response :success
	end
end
