class InscriptionsController < ApplicationController
  # GET /inscriptions
  # GET /inscriptions.json
  
  before_filter :require_admin, :only => [:edit,:update,:destroy]
  before_filter :authenticate_user!, :only => [:show,:index, :favorites, :add_to_favorites, :remove_from_favorites]
  before_filter :require_admin_if_waiting, :only => [:add_to_favorites,:remove_from_favorites, :show, :edit]
  before_filter :check_register_student, :only => [:new,:create]
  
  
   def success
      @inscription = Inscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def favorites
     @inscriptions = current_user.inscriptions.approved.paginate :page => params[:page], :order => 'created_at DESC'
   

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def add_to_favorites
    #  @inscription = Inscription.find(params[:id])
      
     @favorite = Favorite.new
     @favorite.user = current_user
     @favorite.inscription = @inscription
     
     InscriptionMailer.profile_favorited(@inscription, current_user).deliver
     
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to (params[:ref] ? params[:ref] : @inscription), :notice => "Ce profil a été ajouté à vos entretiens" }
      else
        format.html { redirect_to @inscription, :error => "Ce profil n'a pas été ajouté à vos entretiens" }
      end
    end
    
  end
  
  def remove_from_favorites
      # @inscription = Inscription.find(params[:id])
       
      @favorite = Favorite.where("inscription_id = ? AND user_id = ?", @inscription.id, current_user.id)
      @favorite.delete_all
      
      respond_to do |format|
          format.html { redirect_to @inscription, :notice => "Ce profil a été supprimé de vos entretiens" }
      end
    
  end
  
  
  
  
  def index
    
     if params[:filter]
       column = ''
       case params[:filter]
         when "laboratory"
           column = "laboratory"
         when "status"
           column = "status"
         when "ecole"
           column = "centrale"
       end
       @inscriptions = Inscription.approved.visible.where(column+" = ?", params[:filter_val]).paginate(:page => params[:page], :order => 'created_at DESC')
     else  
       @inscriptions = Inscription.approved.visible.paginate :page => params[:page], :order => 'created_at DESC'
     end
    
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @inscriptions }
    end
  end

  # GET /inscriptions/1
  # GET /inscriptions/1.json
 def show
      #@inscription = Inscription.find(params[:id])

      respond_to do |format|

 format.html # show.html.erb
        # if not @inscription.approved and not current_user.admin?
          # flash[:alert] = "You must be admin to access this section"
          # redirect_to new_user_session_url # Prevents the current action from running
        # else
          # format.html # show.html.erb
        # end
        
      end
    end

  # GET /inscriptions/new
  # GET /inscriptions/new.json
  def new
    @inscription = Inscription.new
    @areas = Area.find(:all)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /inscriptions/1/edit
  def edit
   # @inscription = Inscription.find(params[:id])
  end

  # POST /inscriptions
  # POST /inscriptions.json
  def create
    @inscription = Inscription.new(params[:inscription])
    
    respond_to do |format|
      if @inscription.save
        format.html { redirect_to success_inscription_path(@inscription), :notice => 'Votre profil a été envoyée à la modération.' }
        format.json { render :json => @inscription, :status => :created, :location => @inscription }
      else
        format.html { render :action => "new" }
        format.json { render :json => @inscription.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # PUT /inscriptions/1
  # PUT /inscriptions/1.json
  def update
    @inscription = Inscription.find(params[:id])

    respond_to do |format|
      if @inscription.update_attributes(params[:inscription])
        format.html { redirect_to @inscription, :notice => 'Inscription was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @inscription.errors, :status => :unprocessable_entity }
      end
    end
  end

end
