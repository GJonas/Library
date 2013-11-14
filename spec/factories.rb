FactoryGirl.define do
	factory :book do
		sequence(:title)  { |n| "Book #{n}" }
		sequence(:author) { |n| "book_#{n}author"}
		sequence(:gender)  { |n| "infant" }
		sequence(:edition)  { |n| "Fist" }
		sequence(:year)  { |n| "Year #{n}" }
		
	end


	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		phone "123456"
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
      admin true
    end	
	end
	factory :loan do
    data "01/01/2013"
    user
    
  end
	
end