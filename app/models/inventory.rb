class Inventory < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_numericality_of :quantity, :only_integer =>true
end
