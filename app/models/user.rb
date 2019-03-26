class User < ApplicationRecord
  #Associations
  has_many :posts
  has_secure_password


  #Validations
  validates :name, presence: true
  validates :username, uniqueness: { case_sensitive: false}
end
