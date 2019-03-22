class User < ApplicationRecord
  #Associations
  has_many :posts
  
  #Validations
  validates :name, presence: true
end
