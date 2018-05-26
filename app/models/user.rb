class User < ActiveRecord::Base

  has_many :order

  has_secure_password

end
