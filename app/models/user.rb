# email:string
# password:string

# password: string virtual
# password_confirmation: string virtual
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must be a valid email address" }
  validates :role, presence: true, inclusion: { in: ['user', 'admin'] }
end
