Rails.application.routes.draw do
  resources :products

  get 'static_pages/about'

  get 'static_pages/contact'

  resources :orders, only: [:index, :show, :create, :destroy]

  # root 'static_pages#index'
  # root 'static_pages#landing_page'
  root 'products#index'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
