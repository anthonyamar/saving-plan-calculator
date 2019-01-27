Rails.application.routes.draw do
  get 'calculator/show'
  root 'calculator#new'
  post 'calculator/create'
end
