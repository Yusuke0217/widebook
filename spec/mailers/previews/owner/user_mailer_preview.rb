# Preview all emails at http://localhost:3000/rails/mailers/owner/user_mailer
class Owner::UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/owner/user_mailer/account_activation
  def account_activation
    owner = Owner.first
    owner.activation_token = Owner.new_token
    Owner::UserMailer.account_activation(owner)
  end

  # Preview this email at http://localhost:3000/rails/mailers/owner/user_mailer/passwod_reset
  def passwod_reset
    Owner::UserMailer.passwod_reset
  end

end
