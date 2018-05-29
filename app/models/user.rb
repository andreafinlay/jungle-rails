class User < ActiveRecord::Base

  has_many :reviews
  has_many :order

  has_secure_password

  validates :name, :password, :password_confirmation, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true

  before_save :lowercase_email

  def self.authenticate_with_credentials(email, password)
      user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  protected

  def lowercase_email
    self.email.downcase
  end
end
