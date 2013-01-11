class LogData < ActiveRecord::Base
  attr_accessible :data, :date, :user, :created_at
  
  belongs_to :user
  
  def self.start_logging(user, data, date)
    @log_data = self.create(:user => user, :data => data, :date => date)
    @log_data.save
  end
end
