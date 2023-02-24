Rails.application.routes.draw do
  # get 'bookmarks/new'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/new'

  root to: 'lists#index'

  resources :lists, only: %i[show new create destroy] do
    resources :bookmarks, only: %i[new create]
    resources :reviews,   only: %i[new create]
  end
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :bookmark
end
