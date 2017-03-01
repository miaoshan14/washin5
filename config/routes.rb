Rails.application.routes.draw do

  resources :projects, only: [:index, :show, :edit, :destroy, :new] do
    resources :participations, only: :create
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "projects#index"


  mount Attachinary::Engine => "/attachinary"
end
