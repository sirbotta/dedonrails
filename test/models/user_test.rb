require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "creates the user role on new" do
    @user = User.create(email: "test@gmail.com", password: "somePassword")
    assert @user.user_roles.any? { |user_role| user_role.role == :user.to_s }
  end

  test "user contains the admin role" do
    @user = User.create
    @user.user_roles << [UserRole.new(role: :admin)]
    assert @user.user_roles.any? { |user_role| user_role.role == :admin.to_s }
  end

  test "user contains the dm role" do
    @user = User.create
    @user.user_roles << [UserRole.new(role: :dm)]
    assert @user.user_roles.any? { |user_role| user_role.role == :dm.to_s }
  end

  test "user contains the player role" do
    @user = User.create
    @user.user_roles << [UserRole.new(role: :player)]
    assert @user.user_roles.any? { |user_role| user_role.role == :player.to_s }
  end
end
