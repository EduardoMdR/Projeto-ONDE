class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    mail(to: user.email, subject: "Ativação de conta")
  end
  
  def activation_success_email(user)
    @user = user
    mail(to: user.email, subject: "Sua conta foi ativada")
  end
end
