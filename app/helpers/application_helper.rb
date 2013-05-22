module ApplicationHelper

  def display_sum_user_events
    "<b>Benutzte Urlaubstage</b>: #{current_user.events.length}".html_safe
  end

end
