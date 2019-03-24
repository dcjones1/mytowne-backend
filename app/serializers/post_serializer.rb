class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :img, :created_at, :updated_at, :post_tags
  has_many :post_tags
  belongs_to :user

end
