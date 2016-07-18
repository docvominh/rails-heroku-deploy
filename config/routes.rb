Rails.application.routes.draw do

  get 'login', to: 'login#index'
  get 'logout', to: 'login#logout'
  post 'login/login'

  get 'user/index'
  get 'user/create'
  post 'user/create_user'
  get 'user/update/:user_id', to: 'user#update'
  put 'user/update_user', to: 'user#update_user'
  delete 'user/delete/:id', to:'user#delete'
  get 'user/all'

  root 'home#index'
  get 'home', to: 'home#index'
  get 'home/index', to: 'home#index'
  get 'home/simple-form', to: 'home#simple_form'
  get 'home/about'
  post 'home/create'
  get 'home/show'

end
