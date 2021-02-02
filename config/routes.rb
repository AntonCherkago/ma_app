Rails.application.routes.draw do
  get '/posts' => 'posts#index'
  get '/posts/:id' => 'posts#show'
end
