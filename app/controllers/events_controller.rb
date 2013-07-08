class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
 
    respond_to do |format|
      format.html  
      format.json  { render :json => @event }
    end
  end
  
  def create
    @event = current_user.events.create(params[:event])

    respond_to do |format|
      if @event.save
        LogData.start_logging(current_user, "created", @event.start_at)
        format.html { redirect_to(root_path, :notice => 'event created') }
        format.json { head :created }
      else
        format.json { head :no_content }
      end
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    @categories = Category.all
  end
  
  def update
    @event = Event.find(params[:id])
   
    respond_to do |format|
      if @event.update_attributes(params[:event])
        LogData.start_logging(current_user, "updated", @event.start_at)
        format.html  { redirect_to(root_path, :notice => 'event was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end  
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
   
    respond_to do |format|
      LogData.start_logging(current_user, "destroyed", @event.start_at)
      format.html { redirect_to(root_path, :notice => 'event deleted') }
      format.json { head :no_content }
    end
  end
end
