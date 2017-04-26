Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
  	member do
  		put "like", to: "books#upvote"
  		end
 	end

  root "books#index"

end
