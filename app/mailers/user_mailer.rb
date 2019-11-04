class UserMailer < ApplicationMailer
  default from: 'no-reply@fannyfashion.fr'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://fannyfashion.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end


  def inscription_event(attendance)
  	@attendance = attendance
  	@url = 'https://fannyfashion.herokuapp.com/'

    mail(to: @attendance.event.admin.email, subject: 'Une nouvelle inscription à votre event !') 

  end

end
