class Blog::Entities::Index < Grape::Entity
  expose :id
  expose :author do |post|
    post.user.first_name
  end

  expose :title
  expose :published_at, as: :published
  expose :body, as: :description
  expose :images, using: Blog::Entities::Image do |post|
    post.user.images
  end
end
