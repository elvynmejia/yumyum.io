require 'httparty'

AUTH_HEADER = { :headers => { "Authorization" => "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb" } }

def get_restaurants_by_location(lat, long, date, time, party_size = 5, radius = 200)
  datetime = format_datetime(date, time)
  url = "https://platform.otqa.com/availability?latitude=#{lat}&longitude=#{long}&party_size=#{party_size}&radius=#{radius}&forward_minutes=15&backward_minutes=15&start_date_time=#{datetime}&include_unavailable=true"
  open_table_call(url)
end

def open_table_get(url)
  HTTParty.get(url, AUTH_HEADER)
end

def open_table_post(url)
  HTTParty.post(url, AUTH_HEADER)
end


def format_datetime(date, time)
  # TODO fix this
  "2017-03-13T20%3A00"
end

puts get_restaurants_by_location(37.782039, -122.391139, "today", "4:00")
