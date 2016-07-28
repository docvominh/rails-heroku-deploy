Rails.application.routes.draw do

  get 'user_image/index'

  get 'user_image/new'

  post 'user_image/create'

  get 'user_image/destroy'

  post 'user_image/image_autocomplete'

  get 'login', to: 'login#index'
  get 'logout', to: 'login#logout'
  post 'login/login'

  get 'user/index'
  get 'user/create'
  post 'user/create_user'

  get 'user/create_ajax_form'
  post 'user/create_user_rails_ajax_form'

  get 'user/update/:user_id', to: 'user#update'
  put 'user/update_user', to: 'user#update_user'
  delete 'user/delete/:id', to: 'user#delete'
  get 'user/all'
  get 'user/search_user'
  get 'user/insert_default'

  # get 'user/all-image', to: 'user#user_image'
  # get 'user/upload_user_image_index'
  # post 'user/upload_user_image'
  # delete 'user/delete_image/:id', to: 'user#delete_image'

  root 'home#index'
  get 'home', to: 'home#index'
  get 'home/index', to: 'home#index'
  get 'home/simple-form', to: 'home#simple_form'
  get 'home/about'
  post 'home/create'
  get 'home/show'
end
