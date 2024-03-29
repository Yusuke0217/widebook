class Owner::UserMailer < Owner::BaseMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.owner.user_mailer.account_activation.subject
  #
  def account_activation(owner)
    @owner = owner
    # @greeting = "こんにちは！"
    @greeting = "Hello!"

    # mail to: owner.email, subject: "アカウントの有効化リンク" 
    mail to: @owner.email, subject: "Account-activation" 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.owner.user_mailer.passwod_reset.subject
  #
  def password_reset(owner)
    @owner = owner
    # @greeting = "こんにちは！"
    @greeting = "Hello"

    # mail to: @owner.email, subject: "パスワード再設定リンク"
    mail to: @owner.email, subject: "Password-Reset"
  end
end
