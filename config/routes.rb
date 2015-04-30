Rails.application.routes.draw do

  get 'attachments/attachment1', as: :attachment1

  get 'attachments/attachment2', as: :attachment2

  get 'attachments/attachment3', as: :attachment3

  get 'attachments/attachment4', as: :attachment4

  resources :attachments, only: :index

  root 'attachments#index'

end
