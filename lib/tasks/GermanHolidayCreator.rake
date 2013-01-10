namespace :db do
  desc "Insert all Data from Gem 'Holiday' belonging German Holidays into DB"
  task :load_german_holidays => :environment do
    year = Time.now.year
    from = Date.civil(year,1,1)
    to = Date.civil(year+1,12,31)
    @holidays = Holidays.between(from, to, :de)
    @holidays.each do |holiday|
      if Event.where(:name => holiday[:name], :start_at => holiday[:date]).empty?
        @event = Event.new()
        @event.name = holiday[:name]
        @event.start_at = holiday[:date].to_s
        @event.end_at = @event.start_at
        @event.all_day = true
        @event.category = Category.where(:name => "Feiertag").first
        @event.save
      end
    end
  end
end