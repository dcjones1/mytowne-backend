class PostTagSerializer < ActiveModel::Serializer
  attributes :id, :tag_name, :tag_id, :post_id

  def tag_name
    self.object.tag.name
  end
end
