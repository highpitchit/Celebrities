Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "celebs#index"

post "/celebs", to: "celebs#create", as: "create"
get "/celebs/:id", to: "celebs#show", as: "shows"
delete "/celebs/:id", to: "celebs#destroy", as: "delete"
put "/celebs/:id", to: "celebs#update", as: "update"

end
