Retranslator::Application.routes.draw do
  resources :projects

  devise_for :users

  root :to => 'welcome#index'

  match '/dashboard' => 'static_pages#dashboard', :as => :dashboard
end
