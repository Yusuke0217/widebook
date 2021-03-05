module CommonModule
  extend ActiveSupport::Concern
  
  def downcase_email
    self.email = email.downcase
  end
  
end