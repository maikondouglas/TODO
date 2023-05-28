# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks, except: [:show] do
    collection do
      get :export_csv
    end
  end
end
