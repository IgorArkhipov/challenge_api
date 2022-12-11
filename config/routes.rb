# frozen_string_literal: true

Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :partners, only: %i[show index match_partners] do
        collection do
          post :match
        end
      end
      resources :tokens, only: [:create]
    end
  end
end
