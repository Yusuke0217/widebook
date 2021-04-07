class Payment < ApplicationRecord

  belongs_to :owner, dependent: :destroy
  
end
