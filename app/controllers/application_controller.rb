class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Enable Devise Authentication
  before_action :authenticate_user!

  protected
  def set_page_title(title)
  	@page_title = title
  end
end
