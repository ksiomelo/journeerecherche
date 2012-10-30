class InscriptionMailer < ActionMailer::Base
  default :from => "uj2cp@ecp.fr"
  
  def confirmation_mail(inscription)
    @inscription = inscription
    mail(:to => inscription.email, :subject => "Votre inscription à la Journée de la Recherche")
  end
  
   def profile_favorited(inscription,enterprise)
    @inscription = inscription
    @enterprise = enterprise
    mail(:to => inscription.email, :subject => "Une entreprise vous propose un entretien !")
  end
  
  
  
end
