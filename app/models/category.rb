class Category < ActiveRecord::Base
  
  attr_accessible :id, :name
  
  has_many :events

end