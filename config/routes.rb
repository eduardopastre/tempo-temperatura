Rails.application.routes.draw do
  root 'home#index'
  get 'previsao/cidade/:city/:state', to: 'previsao#cidade'
end
