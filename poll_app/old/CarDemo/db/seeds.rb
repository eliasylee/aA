
# 1-Claire, 2-Ken, 3-Gage, 4-Jeff
User.create!(name: "Claire", city: "San Francisco")
User.create!(name: "Ken", city: "Oakland")
User.create!(name: "Gage", city: "San Francisco")
User.create!(name: "Jeff", city: "San Francisco")

# Claire has a Civic, Gage has a Prius
Car.create!(make: "Honda", model: "Civic", year: 2005, owner_id: 1)
Car.create!(make: "Toyota", model: "Prius", year: 2009, owner_id: 3)

# Ken rents Claire's Car
Rental.create!(renter_id: 2,
               car_id: 1,
               start_date: 30.days.ago,
               end_date: 20.days.ago)

# Ken rents Gage's car
Rental.create!(renter_id: 2,
              car_id: 2,
              start_date: 10.days.ago,
              end_date: 7.days.ago)

# Jeff rents Claire's car
Rental.create!(renter_id: 4,
               car_id: 1,
               start_date: 60.days.ago,
               end_date: 40.days.ago)

# Claire rents Gage's car
Rental.create!(renter_id: 1,
               car_id: 2,
               start_date: 5.days.ago,
               end_date: Date.today)
