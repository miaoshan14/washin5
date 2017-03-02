Rails.application.routes.draw do

  resources :projects, only: [:index, :show, :edit, :destroy, :new] do
    resources :participations, only: [:create, :new]
  end

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "projects#index"


  mount Attachinary::Engine => "/attachinary"
end
