class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.registration_confirmation.subject
  #
  def send_signup_email(user)
    @user = user
    mail to: @user.email, subject: "会員登録が完了しました。"
  end
  
  
  # def completion_of_registration(user)
  #   @user = user
  #   mail(:subject => "登録完了のお知らせ" , to: user.email)
  # end
  
  # def registration_confirmation
  #   @greeting = "Hi"

  #   mail to: "missi0415@gmail.com"
  # end
end
