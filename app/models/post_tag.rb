class PostTag < ApplicationRecord
  #Associations
  belongs_to :post, inverse_of: :post_tags
  belongs_to :tag, inverse_of: :post_tags

  #Validations
  validates :tag_id, presence: true
  validates :post_id, presence: true
  validates_uniqueness_of :tag_id, :scope => :post_id

end
