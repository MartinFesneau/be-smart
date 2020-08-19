require 'faker'
require 'open-uri'

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
  file = URI.open('https://source.unsplash.com/random/800x600')
  philosophe = Philosopher.new(nationality: "Greek",
                      first_name:"",
                      last_name: Faker::GreekPhilosophers.name,
                      birthday: Faker::Date.between(from: '0001-01-01', to: '1000-01-01'),
                      specialty: Faker::Educator.subject,
                      address: ["Athens", "Heraklion", "Rhodes"].sample,
                      price_per_night: (25..75).to_a.sample,
                      description: Faker::GreekPhilosophers.quote,
                      prestations: Philosopher::PRESTATIONS.sample(2),
                      )
  philosophe.photo.attach(io: file, filename: 'profil-picture.jpeg', content_type: 'image/jpeg')
  philosophe.user = jean
  philosophe.save!
end

puts 'End creating philosopher'
