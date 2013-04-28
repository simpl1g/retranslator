Retranslator::Application.routes.draw do

  resources :projects do
    scope :module => "project" do
      resources :translators
    end
    resources :locale_files do
      resources :phrases_translations
      resources :phrases do
        resources :phrases_translations do

        end
      end
    end
  end

  resources :languages do
    get :translators, :on => :member
  end

  devise_for :users

  root :to => 'welcome#index'

  match '/dashboard' => 'static_pages#dashboard', :as => :dashboard
end
