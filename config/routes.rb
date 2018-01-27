Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :staffs do
    resources :votes
  end

  root to: "pages#home"
end
