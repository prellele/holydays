class Category < ActiveRecord::Base
  attr_accessible :id, :name, :color
  
  has_many :event

  validates_uniqueness_of :name
end
