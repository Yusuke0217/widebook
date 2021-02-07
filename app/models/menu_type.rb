class MenuType < ApplicationRecord
  has_many :menus, dependent: :destroy
end
