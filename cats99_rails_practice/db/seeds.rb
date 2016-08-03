# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: "2015/04/20", color: "orange", name: "Dankster", sex: "M", description: "Lives in trees")
Cat.create!(birth_date: "2006/06/06", color: "black", name: "Satan", sex: "F", description: "Is a bad cat")
Cat.create!(birth_date: "2012/12/12", color: "calico", name: "Tsunami", sex: "M", description: "Destroyer of worlds")
Cat.create!(birth_date: "1992/08/26", color: "grey", name: "Axel", sex: "M", description: "Should be dead by now")

CatRentalRequest.create!(cat_id: 1, start_date: "09/05/2015", end_date: "09/06/2015")
CatRentalRequest.create!(cat_id: 1, start_date: "10/05/2015", end_date: "10/06/2015")
CatRentalRequest.create!(cat_id: 1, start_date: "11/05/2015", end_date: "11/06/2015")
CatRentalRequest.create!(cat_id: 1, start_date: "12/05/2015", end_date: "12/06/2015")
