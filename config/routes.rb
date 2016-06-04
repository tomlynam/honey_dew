Rails.application.routes.draw do
  get 'items/index'

  get 'items/show'

  get 'items/new'

  get 'items/edit'

  get 'lists/index'

  get 'lists/show'

  get 'lists/new'

  get 'lists/edit'

 root 'home#index'

  devise_for :users, controllers: {
   registrations: 'users/registrations'
 }
  end
