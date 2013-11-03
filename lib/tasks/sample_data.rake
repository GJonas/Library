namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Jonas Moreira",
                 email: "jonas2moreira@ig.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                   admin: true)

  end
end