class Owner::UserMailer < Owner::BaseMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.owner.user_mailer.account_activation.subject
  #
  def account_activation(owner)
    @owner = owner
    @greeting = "こんにちは！"

    mail to: owner.email, subject: "アカウントの有効化リンク" 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.owner.user_mailer.passwod_reset.subject
  #
  def passwod_reset
    @greeting = "こんにちは！"

    mail to: "to@example.org"
  end
end
