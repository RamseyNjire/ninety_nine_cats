# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

caesar = Cat.create(birth_date: "2015-09-08", color: "black", name: "Caesar", sex: "M", description: "This cat is curious, has a quirky sense of humour, and loves chicken")
cleopatra = Cat.create(birth_date: "2019-09-23", color: "white", name: "Cleopatra", sex: "F", description: "This cat is laid back, has a dark sense of humour, and loves to watch TV")
aurelius = Cat.create(birth_date: "2016-06-01", color: "brown", name: "Aurelius", sex: "M", description: "This cat is easygoing, loves slapstick humour, and enjoys scrolling through Instagram")

CatRentalRequest.create(cat_id: caesar.id, start_date: Date.today, end_date: Date.today + 3, status: "APPROVED")
CatRentalRequest.create(cat_id: caesar.id, start_date: Date.today + 4, end_date: Date.today + 7, status: "APPROVED")
CatRentalRequest.create(cat_id: cleopatra.id, start_date: Date.today, end_date: Date.today + 3)
CatRentalRequest.create(cat_id: aurelius.id, start_date: Date.today, end_date: Date.today + 3, status: "DENIED")





