class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    # root page
    # redirect_to controller: "sessions", action: "new" unless session[:name]
    if !session[:name]
      redirect_to controller: "sessions", action: "new"
    end
  end

  def current_user
    session[:name]
  end

  private

  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end  
end
