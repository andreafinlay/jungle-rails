class User < ActiveRecord::Base

  has_many :reviews
  has_many :order

  has_secure_password

  validates :name, :password, :password_confirmation, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true

    def self.authenticate_with_credentials(email, password)
      user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
