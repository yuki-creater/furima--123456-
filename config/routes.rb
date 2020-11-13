
Rails.application.routes.draw do
  # root to: "items#index"
 resources :transactions, only: [:index, :new, :create]
  
end