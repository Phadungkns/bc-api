# frozen_string_literal: true

Rails.application.routes.draw do
  root to: proc { [200, {}, ['ok']] }

  namespace :api do
    namespace :v1 do
      resources :books
      resources :categories
      resources :authors
    end
  end
end
