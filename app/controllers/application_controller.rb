class ApplicationController < ActionController::Base
  ## Pagination Page Number
  def page
    @page ||= params[:page] || 20
  end

  ## Pagination Per Page Records
  def per_page
    @per_page ||= params[:per_page] || 20
  end
end