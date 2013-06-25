class Event < ActiveRecord::Base
  
  attr_accessible :id, :name, :user, :category_id, :start_at, :end_at, :all_day
  
  belongs_to :user
  belongs_to :category
  
  scope :holidays, lambda { where("category_id = ?", 1) }

  has_event_calendar

  def description
  	(name || "#{self.user.username} #{self.category.name}".titleize )
  end

end