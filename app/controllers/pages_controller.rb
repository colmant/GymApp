class PagesController < ApplicationController
  before_action :admin_logged_in?, 
  def home
    
  end
  
  def show
    
  end
  
  private def admin_logged_in?
    if user_signed_in? && current_user.admin
      render "pages/show" and return
    end
  end
end