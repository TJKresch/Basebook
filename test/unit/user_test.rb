require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:user_friendships)
  should have_many(:friends)

  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last_name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile_name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
	user.profile_name = users(:tyler).profile_name
   	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: "Tyer", last_name: "Kresch", email: "tjkresch@gmail.com")
    user.password = user.password_confirmation = 'password'
    user.profile_name = "Name with spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?('must be formatted correctly.')
  end
  
  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: "Tyer", last_name: "Kresch", email: "tjkresch@gmail.com")
    user.password = user.password_confirmation = 'password'
     user.profile_name = 'T_magnus33'
    assert user.valid?
  end

  test "that no error is raised when trying to access a friend list" do
    assert_nothing_raised do
      users(:tyler).friends
    end
  end

  test "that creating friendships on a user works" do
    users(:tyler).friends << users(:hannah)
    users(:tyler).friends.reload
    assert users(:tyler).friends.include?(users(:hannah))
  end
end
