Rails.application.routes.draw do
  root to: 'pages#home'
  resources :orders, except: [ :destroy ]
  resources :invoices, except: [ :destroy ]

end
