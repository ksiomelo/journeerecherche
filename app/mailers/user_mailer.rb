class UserMailer < ActionMailer::Base
  default :from => "uj2cp@ecp.fr"
  
  def confirmation_mail(user)
    @user = user
    mail(:to => user.email, :subject => "Votre inscription à la Journée de la Recherche")
  end
  
end
