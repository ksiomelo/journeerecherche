class BaseController < ApplicationController
  def index
   # render 'index', :locals => {:resource => User.new, :resource_name => ""}
   @last_inscriptions = Inscription.approved.order("created_at DESC").limit(5)
   @last_enterprises = User.approved.order("created_at DESC").limit(5)
  end

end
