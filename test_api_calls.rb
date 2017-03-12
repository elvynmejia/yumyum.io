require 'httparty'

class APIUtil

  AUTH_HEADER = { "Authorization" => "Bearer 27037c67-f394-4cfd-ab51-069ac71132fb" }


  def self.get_restaurants
    url = "https://platform.otqa.com/availability/334879?start_date_time=2017-03-29T18%3A00&party_size=2&forward_minutes=120&backward_minutes=30"
    open_table_get(url)
  end


  def self.get_restaurants_by_location(lat, long, date, time, party_size = 5, radius = 200)
    # Returns an array of restaurant objects
    datetime = format_datetime(date, time)
    url = "https://platform.otqa.com/availability?latitude=#{lat}&longitude=#{long}&party_size=#{party_size}&radius=#{radius}&forward_minutes=15&backward_minutes=15&start_date_time=#{datetime}&include_unavailable=true"
    open_table_get(url)
  end

  def self.provisional_lock(size, date, time, restaurant_id)
    # Returns status code, reservation token with an expiration time
    datetime = format_datetime(date, time)
    url = "https://platform.otqa.com/booking/slot_locks"
    data = {
      party_size: size,
      date_time: datetime,
      reataurant_id: restaurant_id
    }
    open_table_post(url, data)
  end

  def self.make_reservation(data)
    open_table_post("https://platform.otqa.com/booking/reservations", data)
  #   Sample Request Body
  # {
  #   "restaurant_id": 123,
  #   "reservation_token": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyOD...",
  #   "first_name": "adam.west",
  #   "last_name": "adam.west",
  #   "email_address": "adam.west@example.com",
  #   "phone_number": "8008880000", //deprecated, use "phone" entity
  #   "phone": {
  #     "number": "8008880000",
  #     "country_code": "UK",
  #     "phone_type": "Mobile",
  #     "extension": "124"
  #   },
  #   "special_request": "special request",
  #   "is_third_party": false,
  #   "offer_id": 555
  # }
  #
  #
  # Sample Request Body for third party reservations
  # {
  #   "restaurant_id": 123,
  #   "reservation_token": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyOD...",
  #   "first_name": "adam.west",
  #   "last_name": "adam.west",
  #   "email_address": "adam.west@example.com",
  #   "phone_number": "8008880000", //deprecated, use "phone" entity
  #   "phone": {
  #     "number": "8008880000",
  #     "country_code": "UK",
  #     "phone_type": "Mobile",
  #     "extension": "124"
  #   },
  #   "special_request": "special request",
  #   "is_third_party": true,
  #   "offer_id": 555,
  #   "restaurant_email_marketing_opt_in": false,
  #   "diner_info": {
  #       "first_name": "John",
  #       "last_name": "Smith",
  #       "phone": {
  #           "phone_type": "Mobile",
  #           "country_code": "US",
  #           "number": "8285552233",
  #           "extension": "124"
  #       }
  #   }
  # }

  end

  def self.get_reservation(restaurant_id, confirmation_number)
    url = "https://platform.opentable.com/booking/reservations/#{restaurant_id}-#{confirmation_number}"
    open_table_get(url)
  end

  def open_table_get(url)
    HTTParty.get(url, headers: AUTH_HEADER)
  end

  def open_table_post(url, data)
    headers = AUTH_HEADER.dup
    headers['Content-Type'] = 'application/json'
    HTTParty.post(url, body: data.to_json, headers: headers)
  end


  def format_datetime(date, time)
    # TODO fix this
    "2017-03-13T20%3A00"
  end

  # puts get_restaurants_by_location(37.782039, -122.391139, "today", "4:00")
  # puts provisional_lock(5, "today", "4:00", 334879)
end
