# frozen_string_literal: true

Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tokens, only: [:create]
    end
  end
end
