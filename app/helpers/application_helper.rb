module ApplicationHelper

  def display_sum_holidays
    current_user.events.holidays.collect{|e| business_days_between(e.start_at, e.end_at)}.sum
  end

  def business_days_between(date1, date2)
  	if date1 && date2
      business_days = 0
      date = date2
      while date > date1
       business_days = business_days + 1 unless date.saturday? or date.sunday?
       date = date - 1.day
      end
      business_days
    else 
      0
    end
  end

end
