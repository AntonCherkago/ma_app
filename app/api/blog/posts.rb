class Blog::Posts < Grape::API
  helpers Blog::Helpers::Posts

  resources :posts do
    desc 'Create a new post'
    params do
      requires :title, type: String
      requires :body, type: String
      requires :published_at, type: String
    end

    desc 'Show list of posts'
    get do
      posts = Post.published
      present posts, with: Blog::Entities::Index
    end

    route_param :id do
      desc 'Return a special post'
      get do
        post = Post.find(params[:id])
        present post, with: Blog::Entities::Index
      end

      desc 'Update a special post'
        params do
          requires :title, type: String
          requires :body, type: String
          requires :published_at, type: String
        end
      patch do
        Post.find(params[:id]).update(declared_params)
      end

      desc 'Delete a special post'
      delete do
        post = Post.find(params[:id])
        post.destroy
      end
    end
  end

  resources :images do
    desc 'Create image'
    params do
      requires :image, type: Hash do
        requires :url, type: String, desc: 'New Image'
      end
    end
    post do
      @image = Image.new(params[:url])
      @post = Post.find(params[:id])
      @image = @post.images.create!(params[:url])
      @post.update(url: @image.url)
    end
  end
end

