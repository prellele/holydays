class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def toggle_holiday
    # IMPROVE: Could not pass params[] to create, duplicated code 
    date = "#{params[:event]["start_at(1i)"]}-#{params[:event]["start_at(2i)"]}-#{params[:event]["start_at(3i)"]}"
    if current_user.events.exists?(:start_at => date)
      @event = current_user.events.where(:start_at => date).first
      @event.destroy
      LogData.start_logging(current_user, "deleted", date)
      respond_to do |format|
        format.json { head :ok } # IMPROVE: find better status code
      end
    else 
      @event = Event.new()
      @event.user_id = current_user.id
      @event.start_at = date
      @event.name = "#{current_user.username.titleize} Urlaub"
      @event.end_at = @event.start_at
      @event.all_day = true
      @event.category = Category.where(:name => "Urlaub").first
      LogData.start_logging(current_user, "created", date)
      respond_to do |format|
        if @event.save
          format.json { head :created }        
        end
      end
    end
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
        format.json { head :created }
      else
        format.json { head :no_content }
      end
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
   
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html  { redirect_to(list_events_path, :notice => 'event was successfully updated.') }
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
      format.html { redirect_to(root_path, :notice => 'event deleted') }
      format.json { head :no_content }
    end
  end
end
