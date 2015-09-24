# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Organization.create!(name: "DCW", :category => :dcw)

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

Organization.create!(name: "Police Branch 1", :category => :police)
Organization.create!(name: "Police Branch 2", :category => :police)
Organization.create!(name: "CAW", :category => :others)
Organization.create!(name: "DLSA", :category => :others)
Organization.create!(name: "ICC", :category => :others)
Organization.create!(name: "CAW Division 2", :category => :others)
