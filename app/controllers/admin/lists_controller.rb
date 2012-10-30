class Admin::ListsController < ApplicationController
  # GET /inscriptions
  # GET /inscriptions.json
  
  before_filter :require_admin

  def index
    @ecp_count = Inscription.approved.count(:conditions => "centrale IS TRUE")
     respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  
   def badges
    
      @badges = Inscription.approved.order('first_name ASC')

     render :layout => 'print'
  end
  
   def presenters
    
     @presenters = Inscription.approved.where(:wants_to_present => true).order('first_name ASC') 
     
     render :layout => 'print'
  end
  
  def enterprises
    
     @enterprises = User.approved.order('name ASC') 
     @entreprise_lunch_count = User.approved.where(:lunch => true).sum(:participants)
     render :layout => 'print'
  end
  
  
  
  
end
