user1 = User.create(email: 'openseat1@openseat.com', password: 'openseat123', password_confirmation: 'openseat123')
User.create(email: 'openseat2@openseat.com', password: 'openseat123', password_confirmation: 'openseat123')
User.create(email: 'openseat4@openseat.com', password: 'openseat123', password_confirmation: 'openseat123')
User.create(email: 'openseat5@openseat.com', password: 'openseat123', password_confirmation: 'openseat123')
User.create(email: 'openseat6@openseat.com', password: 'openseat123', password_confirmation: 'openseat123')

Booking.create(user: user1, confirmation_number: 1234, message: "OpenSeat", date_time: Time.zone.now + 2.hour, party_size: 6, restaurant_id: 12345)