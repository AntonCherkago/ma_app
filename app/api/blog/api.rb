class Masters::API < Grape::API
  format :json
  prefix :api
  #mount Masters::Posts
end