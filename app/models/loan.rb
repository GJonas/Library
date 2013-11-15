class Loan < ActiveRecord::Base
	 belongs_to :user
	 belongs_to :book
	  
	  
	
	  default_scope -> { order('created_at DESC') }
	 validates :user_id, presence: true



	 
end
