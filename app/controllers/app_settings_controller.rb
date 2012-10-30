class AppSettingsController < ApplicationController
  # GET /inscriptions
  # GET /inscriptions.json
 

  # PUT /inscriptions/1
  # PUT /inscriptions/1.json
  def update

    respond_to do |format|
      if @app_settings.update_attributes(params[:app_settings])
        format.html { redirect_to app_settings_admin_inscriptions_path, :notice => 'Configuration updated.' }
      else
        format.html { redirect_to app_settings_admin_inscriptions_path, :alert => 'Configuration not updated.' }
      end
    end
  end

end
