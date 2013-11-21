namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Jonas Moreira",
                 email: "jonas2moreira@ig.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                   admin: true)

  4.times do |n|
  	Book.create!(
  		title: Faker::Name.name,
  		author: Faker::Name.name,
  		avatar: File.open(Dir.glob(File.join(Rails.root,'spec/sample_image', '*')).sample)
  		)
  end
  end
end