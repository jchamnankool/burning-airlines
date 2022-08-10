User.destroy_all
u1 = User.create :email => "admin@ga.co", :password => "chicken", :admin => true
u2 = User.create :email => "a@ga.co", :password => "chicken"
u3 = User.create :email => "b@ga.co", :password => "chicken"
u4 = User.create :email => "c@ga.co", :password => "chicken"
