namespace :booking do
  desc "TODO"
  task remove_pending: :environment do
     oldBookings = Booking.where("status = ? AND created_at < ?", "pending", 2.days.ago)
     puts "removing unsubmitted bookings more than a day old"
     oldBookings.each do |booking|
       booking.destroy
     end
     puts "old bookings removed"
  end
end
