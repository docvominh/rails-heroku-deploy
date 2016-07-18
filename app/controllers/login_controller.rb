class LoginController < ApplicationController
  def index
    @model = Login.new("", "")
  end

  def login
    login_info = login_params
    user_id = login_info['user_id']
    password = login_info['password']

    @model = Login.new(user_id, password)

    if @model.invalid?
      render action: "index"
    else
      user = UserModel.authenticate(user_id, password)
      if user
        session[:user_id] = user_id
        cookies[:user_id_cookie] = user_id

        if session[:current_url]
          current_url = session[:current_url]
          session[:current_url] = nil
          redirect_to current_url
        else
          redirect_to controller: "home", action: "index"
        end
      else
        @model.errors[:base] << "Wrong user id or password"
        #@model.errors[:user_id] << "Wrong user id or password"
        render action: "index"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to action: "index"
  end

  private
  def login_params
    # :message is model name
    params.require(:login).permit(:user_id, :password)
  end
end
