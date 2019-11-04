# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |x|
	user = User.create(
	  description: Faker::Quote.famous_last_words, 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false))
	    email: "#{x}@yopmail.com" )
      puts "Seeding of User nb #{x}"
end 


#for the random startdate
t1 = Time.parse("2019-11-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")

2.times do |x|
  event = Event.create(
    start_date: rand(t1..t2),
    duration: rand(5..100)*5,
    description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::Book.title,
    admin_id: User.all.sample.id)
  puts "Seeding of Event nb #{x}"
end

20.times do |x|
  guest = Attendance.create(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id)
  puts "Seeding of Guest nb #{x}"
end