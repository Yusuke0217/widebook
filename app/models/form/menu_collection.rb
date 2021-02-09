class Form::MenuCollection < Form::Base
  FORM_COUNT = 10
  attr_accessor :menus
  
  def initialize(attributes = {})
    super attributes
    self.menus = FORM_COUNT.times.map { Menu.new() } unless self.menus.present?
  end

  def menus_attributes=(attributes)
    self.menus = attributes.map { |_, v| Menu.new(v) }
  end

  def save
    Menu.transaction do
      self.menus.map do |menu|
        if menu.availability # ここでチェックボックスにチェックを入れている商品のみが保存される
          menu.save
        end
      end
    end
      return true
    rescue => e
      return false
  end


end