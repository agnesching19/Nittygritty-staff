Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :staffs do
    resources :votes, only: [:new, :index, :create, :show]
  end
  resources :voted_staffs

  root to: "pages#home"
end
