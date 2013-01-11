class LogDatasController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @logs = LogData.find(:all, :order => "created_at desc")
  end
  
end
