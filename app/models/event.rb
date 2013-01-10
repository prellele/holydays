class Event < ActiveRecord::Base
  
  attr_accessible :id, :name, :user, :category, :start_at, :end_at, :all_day
  
  belongs_to :user
  belongs_to :category
  
  has_event_calendar

end