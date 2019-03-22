class PostTag < ApplicationRecord
  validates :tag_id, presence: true
  validates :post_id, presence: true
  belongs_to :post
  belongs_to :tag 
end
