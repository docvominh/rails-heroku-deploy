class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    if !session[:user_id]

      # current path
      session[:current_url] = request.env['PATH_INFO']

      # previous path
      session[:referer_url] = request.env['HTTP_REFERER']

      redirect_to :controller => 'login', :action => 'index'
    end
  end


end
