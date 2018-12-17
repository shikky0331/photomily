class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :login_id, presence: true, uniquness: true
end
