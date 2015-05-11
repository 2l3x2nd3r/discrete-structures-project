class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  $last_selectables1 = []
  $last_selectables2 = []
  $last_selectables3 = []
  $last_selectables4 = []
  
end
