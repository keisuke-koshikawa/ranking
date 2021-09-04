Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope format: 'json' do # json形式のリクエストに対応
    resources :companies do
      resources :companies
    end
    resources :employees do
      resources :employees
    end
  end
end
