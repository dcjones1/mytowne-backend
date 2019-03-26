class User < ApplicationRecord
  #Associations
  has_many :posts
  has_secure_password

  
  #Validations
  validates :name, presence: true
end
