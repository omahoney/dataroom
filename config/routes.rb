Rails.application.routes.draw do
  resources :companies
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/company_session' => 'home#company_session', :as => 'company_session'
  get 'home/index'
  root :to => 'home#index'
end
