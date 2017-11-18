class User < ApplicationRecord

  after_create :set_default_roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_roles, dependent: :destroy, class_name: "UserRole"

  def set_default_roles
    user_roles.create(role: :user)
  end

  def admin?
    user_roles.pluck(:role).include? :admin
  end

  def player?
    user_roles.pluck(:role).include? :player
  end

  def dm?
    user_roles.pluck(:role).include? :dm
  end

  def user?
    user_roles.pluck(:role).include? :user
  end
end
