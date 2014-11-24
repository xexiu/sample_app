require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "test",:email => "test@test.com",:password => "foobar",:password_confirmation => "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "test#{n+1}@test.com"
      password  = "foobar"
      User.create!(
        :name => name,
        :email => email,
        :password => password,
        :password_confirmation => password)
    end
  end
end

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(
      :name => "sergio",
      :email => "ser@ser.com",
      :password => "foobar",
      :password_confirmation => "foobar")
    admin.toggle!(:admin)
  end
end

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    User.all.each do |user|
      50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(3, true))
      end
    end
  end
end
