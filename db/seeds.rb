# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.mongo_session['roles'].insert({ :name => role })
  puts 'role: ' << role
end
#puts 'DEFAULT USERS'
#user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
#puts 'user: ' << user.name
#user.add_role :admin

a = Doorkeeper::Application.find_or_create_by(
  uid: ENV['API_UID'],
  secret: ENV['API_SECRET'],
  name:'ys',
  redirect_uri: "http://#{ENV['SUBDOMAIN'] + "." unless ENV['SUBDOMAIN'].blank?}realityandapp.com/users/auth/zhaohai/callback"
)
if a.uid != ENV['API_UID']
  a.update_attribute :uid,ENV['API_UID']
  a.update_attribute :secret,ENV['API_SECRET']
end
