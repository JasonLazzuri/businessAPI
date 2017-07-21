# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Business.destroy_all

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_business
  end

  def generate_business
    50.times do |i|
      author =
      business = Business.create!(
        name: Faker::Company.name,
        address: Faker::Address.street_address,
        phone: Faker::PhoneNumber.cell_phone
      )
      puts "Business #{i}: Name is #{business.name} and address is '#{business.address}' and the Phone number is #{business.phone}."
    end
  end
end

Seed.begin
