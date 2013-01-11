module ApplicationHelper

  def display_sum_user_events
    "<li><b>Benutzte Urlaubstage</b>: #{current_user.events.length} </li>".html_safe
  end
end
