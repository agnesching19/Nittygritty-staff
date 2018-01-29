require "faker"

def prepare
  puts "--- cleaning the db ---"
  Staff.destroy_all
  puts "--- destroying all voted staffs ---"
  VotedStaff.destroy_all
  puts "--- destroying all votes ---"
  Vote.destroy_all
  puts "--- database now clean ---"
  puts ""
end

def admin_staff
  puts "--- creating an admin ---"
    Staff.create!({
      email: "admin@nittygritty.net",
      name: "Nitty Gritty",
      admin: true
    })
  puts "    #{Staff.first.name} has been added to the db"
  puts "--- admin staff seeding completed ---"
  puts "--------------------"
end

def staffs(number)
  puts "--- creating #{number} staffs ---"
  number.times {
    name = Faker::Name.name
    email = Faker::Internet.email

    Staff.create!({
      name: name,
      email: email
    })
  }
  puts "--- #{Staff.last.name} has been added to the db ---"
  puts "--- staff seeding completed ---"
  puts "--------------------"
end

def voted_staffs(number)
  puts "--- creating #{number} of voted_staffs ---"
  number.times {
    name = Faker::Name.name

    VotedStaff.create!({
      name: name
    })
  }
  puts "--- #{VotedStaff.last.name} has been added to the db ---"
  puts "--- voted_staff seeding completed ---"
  puts "--------------------"
end

def votes(number)
  puts "--- creating #{number} votes ---"
  number.times {
    staff_id = Staff.all.ids.sample
    voted_staff_id = VotedStaff.all.ids.sample

    Vote.create!({
      staff_id: staff_id,
      voted_staff_id: voted_staff_id
    })
    sleep(2)
  }
  puts "--- New vote #{Vote.first.staff_id} has been added to the db"
  puts "--- vote seeding completed ---"
  puts "--------------------"
end

prepare
puts "--- seeding the db ---"
# Creating the admin staff for the user journey
admin_staff
# Creating 60 staffs
staffs(60)
# Creating 20 voted_staffs
voted_staffs(20)
# Creating 45 votes
votes(45)

puts "--- whooop - all seeding completed ---"

