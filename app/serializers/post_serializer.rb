class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :img, :created_at, :updated_at, :tags
  belongs_to :user
  has_many :tags, through: :post_tags

end
