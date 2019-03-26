class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_date, :email, :username, :town, :avatar, :bio
  has_many :posts

  def posts
    self.object.posts.map do |p|
      {id: p.id, title: p.title, content: p.content, img: p.img, created_at: p.created_at, updated_at: p.updated_at,
        post_tags: p.post_tags.map do |t|
          {id: t.id, post_id: t.post_id, tag_id: t.tag_id, tag_name: t.tag.name}
        end
      }
    end
  end
end
