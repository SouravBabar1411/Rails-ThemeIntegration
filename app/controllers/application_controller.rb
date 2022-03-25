class ApplicationController < ActionController::Base
  before_action :login_require
  
  ## Pagination Page Number
  def page
    @page ||= params[:page] || 20
  end

  ## Pagination Per Page Records
  def per_page
    @per_page ||= params[:per_page] || 20
  end
  protected
  def login_require
    unless logged_in?
      flash[:error] = "You must have to login first"
    end
  end

  def logged_in?
    authenticate_user!
  end
end