Rails.application.routes.draw do
  root to: 'landing#index'

  devise_for :users

  resources :expedientes do
    resources :dictamenes
  end

  resources :dictamenes, only: [] do
    resource :resolucion
  end

  resources :actas do
    resources :descargos
  end

  resources :tipos_de_infraccion
end
