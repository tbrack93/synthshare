Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: 'pages#dashboard'
  resources :synths do
    resources :bookings, except: [:index, :new]
    patch '/bookings/:id/submit', to: 'bookings#submit', as: 'submit_booking'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
