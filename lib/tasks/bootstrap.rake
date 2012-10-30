namespace :bootstrap do
  desc "superuser"
  task :add_superuser => :environment do
    @su = User.new
    @su.name = "UJ2CP"
    @su.tagline = "Union de Jeunes Chercheurs à Centrale Paris"
    @su.email = "uj2cp@ecp.fr"
    @su.password = "uj2cpadmin"
    @su.password_confirmation = "uj2cpadmin"
    @su.website = "http://uj2cp.ecp.fr"
    @su.telephone = "0141131199"
    @su.responsable = "Cassio Melo"
    @su.remember_me = true
    @su.wants_to_interview = false
    @su.approved = true
    @su.participants = 1
    @su.lunch = false
    @su.admin = true
    puts @su.save!
  end
  
  task :add_areas => :environment do
    
  end
  
  task :add_settings => :environment do
    @settings = AppSettings.new
    @settings.save!
  end
  
  
end
