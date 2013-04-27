Retranslator::Application.routes.draw do
  resources :projects


  devise_for :users
end
