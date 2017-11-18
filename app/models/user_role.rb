class UserRole < ApplicationRecord

  belongs_to :user

  enum role: [:admin, :user, :dm, :player]

end
