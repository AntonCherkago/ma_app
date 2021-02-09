class Masters::API < Grape::API
  namespace :posts do
    @user = User.find(params[:user_id])
    @post = posts.find(params[:id])

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