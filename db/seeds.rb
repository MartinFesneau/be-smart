# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Philosopher.destroy_all
User.destroy_all

puts 'Creating user'

jean = User.new(
            email:"jean.martin@gmail.com",
            first_name:"Jean",
            last_name:"Martin",
            description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio, commodi.",
            phone_number:"01 98 29 22 76",
            password: "123456789"
            )

jean.save!

puts 'End creating user'

puts 'Creating philosopher'

10.times do
  philosophe = Philosopher.new(nationality: "Greek",
                      first_name:"",
                      last_name: Faker::GreekPhilosophers.name,
                      birthday: Faker::Date.between(from: '0001-01-01', to: '1000-01-01'),
                      specialty: Faker::Educator.subject,
                      available_location: ["Athens", "Heraklion", "Rhodes"].sample,
                      price_per_night: (25..75).to_a.sample,
                      description: Faker::GreekPhilosophers.quote,
                      prestations: "Peux parler des heures" )
  philosophe.user = jean
  philosophe.save!
end

puts 'End creating philosopher'
