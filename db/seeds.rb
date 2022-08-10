User.destroy_all
puts "Creating users..."
u1 = User.create :email => "admin@ga.co", :password => "chicken", :admin => true
u2 = User.create :email => "a@ga.co", :password => "chicken"
u3 = User.create :email => "b@ga.co", :password => "chicken"
u4 = User.create :email => "c@ga.co", :password => "chicken"
puts "#{User.count} users created."

Airplane.destroy_all
puts "Creating airplanes..."
a1 = Airplane.create :name => "747", :rows => 24, :cols => 4
a2 = Airplane.create :name => "757", :rows => 15, :cols => 4
a3 = Airplane.create :name => "727", :rows => 12, :cols => 4
puts "#{Airplane.count} airplanes created."

Flight.destroy_all
puts "Creating flights..."
f1 = Flight.create :name => "32", :date => DateTime.new(2022, 9, 22), :to => "JFK", :from => "SYD", :plane => "747"
f2 = Flight.create :name => "63", :date => DateTime.new(2022, 10, 14), :to => "LAX", :from => "CDG", :plane => "757"
puts "#{Flight.count} flights created."

# Reservation.destroy_all
# puts "Creating reservations..."
# r1 = Reservation.create :user_id => 2, :flight_id => 2, :row => 12, :col => 3
# puts "#{Reservation.count} reservations created."