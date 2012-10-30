module ApplicationHelper
  
  
  def get_status(status_code)
    case status_code
    when 1
      'Doctorant 1ere année'
    when 2
      'Doctorant 2eme année'
    when 3
      'Doctorant 3eme année'
    when 4
      'Master'
    when 5
      'Chercheur'
    when 6
      'Visiteur'
    when 7
      'Professeur'
    when 8
      'Entreprise'
    end
  end
  
  
  
  def get_centrale(is_centrale)
     (is_centrale) ? 'École Centrale Paris' : 'Supélec' 
  end
  
  def get_labo(labo_code)
    case labo_code
    when 1
      'MAS'
    when 2
      'LGI'
    when 3
      'MSSMat'
    when 4
      'LGPM'
    when 5
      'EM2C'
    when 6
      'SPMS'
    when 7
      'LPQM'
     when 8
      'LISMMA'
     when 9
      'E3S'
    when 10
      'LGEP'
    when 11
      'L2S'
    when 12
      'SONDRA'
    when 13
      'IETR'
    when 14
      'SSIR'
    when 15
      'LMOPS'
     when 16
      'IMS'
    end
  end
  
  def get_avatar(avatar, size)
    if avatar.file? 
      return image_tag avatar.url(size) 
    elsif size.to_s == 'thumb' 
      return image_tag 'missing_tiny.png' 
    else
      return "(pas d'image)"
    end 

  end
  
  
  def get_filters()
    
    filter = params[:filter]
    filter_val = params[:filter_val]
    
    
    string = "<li class='legend'>Sélectionner</li>" 
    string += "<li>" +link_to("Tous", inscriptions_path)+ "</li>"
    
    # status    
    string += "<li class='legend'>Status</li>" 

    (1..7).each do |n|
      #, :class => (filter == 'status' and filter_val == n.to_s) ? "selected" : nil
      string += ( filter == 'status' and filter_val == n.to_s ) ? "<li class='selected'>" : "<li>"
      string += link_to(get_status(n), inscriptions_path(:filter => "status", :filter_val => n.to_s)) 
    end
    
    # labos    
    string += "<li class='legend'>Laboratoire</li>" 

    (1..16).each do |n|
      string += ( filter == 'laboratory' and filter_val == n.to_s ) ? "<li class='selected'>" : "<li>"
      string += link_to(get_labo(n), inscriptions_path(:filter => "laboratory", :filter_val => n.to_s)) 
    end
    
    #ecole
    string += "<li class='legend'>École</li>" 
    
    #centrale | supelec
     string += ( filter == 'ecole' and filter_val == '1' ) ? "<li class='selected'>" : "<li>"
     string += link_to('École Centrale Paris', inscriptions_path(:filter => "ecole", :filter_val => 1))
     
     string += ( filter == 'ecole' and filter_val == '0' ) ? "<li class='selected'>" : "<li>"
     string += link_to("Supélec", inscriptions_path(:filter => "ecole", :filter_val => 0))
    
    #domaine
      
    return string.html_safe
    
  end
  
  
  
end
