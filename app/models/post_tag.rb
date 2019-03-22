class PostTag < ApplicationRecord
  #Associations
  belongs_to :post
  belongs_to :tag 

  #Validations
  validates :tag_id, presence: true
  validates :post_id, presence: true
  validates_uniqueness_of :tag_id, :scope => :post_id

end
