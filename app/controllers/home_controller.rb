class HomeController < ApplicationController
  before_action :company_session_check

  def company_session_check
    if session[:selected_company].nil? then
      company_session
    end
  end

  def company_session
    if params[:id].nil? then
      session[:selected_company] = 0
      redirect_to root_url
    else
      session[:selected_company]= params[:id]
      redirect_to company_dashboards_path(session[:selected_company])
    end
  end

  def index
    @user = current_user
    if params[:filter].nil?
      @companies = Company.active
    else
      if params[:filter] == "All" then @companies = Company.all end
      if params[:filter] == "Active" then @companies = Company.active end
    end
  end

end
