namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:username => "Example User2",
						 :real_name => "Example Name",                         
						 :email => "example555@railstutorial.org",
                         :password => "foobar666",
                         :password_confirmation => "foobar666")
    admin.toggle!(:admin)
  end
end

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:username => "Example User",
				 :real_name => "Example Name",
                 :email => "example@railstutorial.org",
                 :password => "foobar666",
                 :password_confirmation => "foobar666")
    99.times do |n|
      username  = Faker::Name.name
	  real_name = "Allison Smith"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:username => username,
				   :real_name => real_name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end