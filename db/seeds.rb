# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Faker::Config.locale = 'en-IND'

Organization.create(name: "DCW", :category => :dcw)

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

organizations = [
	{name: "Police Branch 1", :category => :police},
	{name: "Police Branch 2", :category => :police},
	{name: "CAW", :category => :others},
	{name: "DLSA", :category => :others},
	{name: "ICC", :category => :others},
	{name: "CAW Division 2", :category => :others}
]

# Organization.create(name: "Police Branch 1", :category => :police)
# Organization.create(name: "Police Branch 2", :category => :police)
# Organization.create(name: "CAW", :category => :others)
# Organization.create(name: "DLSA", :category => :others)
# Organization.create(name: "ICC", :category => :others)
# Organization.create(name: "CAW Division 2", :category => :others)

organizations.each do |x|
	Organization.create(x)
end

100.times do |x|
	Complaint.create(complainant: Faker::Name.name,respondent_if_person: Faker::Name.name,
		contact_number_of_complainant: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address,
		locality: Complaint.locality.values.sample, brief_of_complaint: Faker::Hacker.say_something_smart,
		prayers: Faker::Lorem.sentence
	)
end