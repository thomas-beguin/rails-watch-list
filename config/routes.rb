Rails.application.routes.draw do
  # get 'bookmarks/new'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/new'

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
    resources :reviews,   only: %i[new create]
  end
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :bookmark
end
