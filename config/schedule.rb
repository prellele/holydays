# Load all German Holidays from the 'Holiday' Gem
every '0 0 1 1 *' do
  rake "db:load_german_holidays"
end
