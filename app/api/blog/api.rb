class Blog::API < Grape::API
  format :json
  prefix :api
  mount Blog::Posts => 'api/v1'
end