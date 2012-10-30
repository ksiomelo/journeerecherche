class Admin::InscriptionsController < ApplicationController
  # GET /inscriptions
  # GET /inscriptions.json
  
  before_filter :require_admin
  before_filter :require_admin_if_waiting, :only => [:approve,:destroy]

  def stats
    @inscriptions_count = Inscription.approved.count
    @entreprise_count = User.approved.count
    @participant_count = User.approved.sum(:participants)
    @entreprise_lunch_count = User.approved.where(:lunch => true).sum(:participants)
    @entretenir_count = User.approved.count(:conditions => "wants_to_interview IS TRUE")
    @presenter_count = Inscription.approved.count(:conditions => "wants_to_present IS TRUE")
    @ecp_count = Inscription.approved.count(:conditions => "centrale IS TRUE")
     respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  
   def index
    
      @inscriptions = Inscription.approved.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @inscriptions }
    end
  end
  
  def to_moderate
     @inscriptions = Inscription.waiting.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @inscriptions }
    end
  end
  
  def approve
     #@inscription = Inscription.find(params[:id])
     @inscription.update_attribute(:approved, true)
     InscriptionMailer.confirmation_mail(@inscription).deliver
     respond_to do |format|
       format.html { redirect_to to_moderate_admin_inscriptions_path, :notice => "l'Inscription a été approuvé" }
    end
 
  end
  
  
  
  def app_settings
   # @appsetting = AppSettings.find(1)
    
   # get_app_settings()
    
     respond_to do |format|
       format.html
    end
  end
  
  
  def open_inscription
    
    respond_to do |format|
       format.html { redirect_to to_moderate_admin_inscriptions_path, :notice => "l'Inscription a été approuvé" }
    end
    
  end
  
  def close_inscription
    respond_to do |format|
       format.html { redirect_to to_moderate_admin_inscriptions_path, :notice => "l'Inscription a été approuvé" }
    end
    
  end
  
  
  
  # DELETE /inscriptions/1
  # DELETE /inscriptions/1.json
  def destroy
    #@inscription = Inscription.find(params[:id])
    @inscription.destroy

    respond_to do |format|
      format.html { redirect_to to_moderate_admin_inscriptions_path }
      format.json { head :ok }
    end
  end
  
end
