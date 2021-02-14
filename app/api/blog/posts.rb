module Blog
  module V1
    class Posts < Grape::API
      # helpers Blog::Helpers::Posts

      version 'v1', using: :path
      format :json
      prefix :api

      resources :posts do
        desc 'Return the list of posts'
        get do
          posts = Post.published
          present posts, with: Blog::Entities::Index
        end

        desc 'Create a new post'
        params do
          requires :title, type: String
          requires :body, type: String
          requires :published_at, type: String
        end

        route_param :id do
          desc 'Return a specific post'
          get do
            post = Post.find(params[:id])
            present post, with: Blog::Entities::Index
          end

          desc 'Update a specific post'
            params do
              requires :title, type: String
              requires :body, type: String
              requires :published_at, type: String
            end
          patch do
            Post.find(params[:id]).update(declared_params)
          end

          desc 'Delete a specific post'
          delete do
            post = Post.find(params[:id])
            post.destroy
          end
        end

        end

        namespace :posts do
        params do
          requires :id
          requires :user_id
        end

        get do

        end

        post do

        end

        put do
          post.find(params[:id]).update({ rating:params[:rating] })
        end

        post 'publish' do

        end

        post 'unpublish' do

        end

        delete do

        end
      end
    end
  end
end
