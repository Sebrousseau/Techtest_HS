Rails.application.routes.draw do
  root to: 'pages#home'
  resources :orders, except: [:destroy]
  resources :order_products, only: %i[new create destroy]
  resources :invoices, except: [:destroy]
  patch 'orders/:id/update_status', to: 'orders#update_status', as: :update_status
end
