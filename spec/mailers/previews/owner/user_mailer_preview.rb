# Preview all emails at http://localhost:3000/rails/mailers/owner/user_mailer
class Owner::UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/owner/user_mailer/account_activation
  def account_activation
    owner = Owner.last
    owner.activation_token = Owner.new_token
    Owner::UserMailer.account_activation(owner)
  end

  # Preview this email at http://localhost:3000/rails/mailers/owner/user_mailer/password_reset
  def password_reset
    owner = Owner.first
    owner.reset_token = Owner.new_token
    Owner::UserMailer.password_reset(owner)
  end

end
