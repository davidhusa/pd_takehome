Rails.application.routes.draw do
  root to: 'home#index'
  namespace :v1 do
    get 'deals', to: "deals#index"
  end
end
