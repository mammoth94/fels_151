class User < ApplicationRecord
   before_save { email.downcase! }
   validates :name,  presence: true, length: { maximum: Settings.max_1 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: Settings.max_2 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness:{ case_sensitive: false }
   has_secure_password
   validates :password, presence: true, length: { minimum: Settings.min_1 }
   
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
