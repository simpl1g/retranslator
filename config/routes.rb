Retranslator::Application.routes.draw do

  resources :projects do
    scope :module => "project" do
      resources :locale_files
      resources :translators
    end
  end

  resources :languages do
    get :translators, :on => :member
  end

  devise_for :users

  root :to => 'welcome#index'

  match '/dashboard' => 'static_pages#dashboard', :as => :dashboard
end
