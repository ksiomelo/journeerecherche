class Admin::UsersController < ApplicationController
  # GET /inscriptions
  # GET /inscriptions.json
  
  before_filter :require_admin
  #before_filter :require_admin_if_waiting, :only => [:approve,:destroy]
  def print
    
     @user = User.find(params[:id])
     
     render :layout => 'print'
 
  end

   def index
    
    @users = User.approved.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @inscriptions }
    end
  end
  
  def to_moderate
     @users = User.waiting.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
  
  def approve
     @user = User.find(params[:id])
     @user.update_attribute(:approved, true)
     UserMailer.confirmation_mail(@user).deliver
     respond_to do |format|
       format.html { redirect_to to_moderate_admin_users_path, :notice => "l'Entreprise a été approuvé" }
    end
 
  end
  
  def display
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
    end
    
  end
  # DELETE /inscriptions/1
  # DELETE /inscriptions/1.json
  def destroy
    #@inscription = Inscription.find(params[:id])
     @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to to_moderate_admin_users_path }
      format.json { head :ok }
    end
  end
  
end
