class Book < ActiveRecord::Base
	has_many :loans, dependent: :restrict_with_error

#destroy
	#attr_accessible :avatar
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	#has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates :title, presence: true
	validates :author, presence: true



	def self.search(search, page)
		if search
			paginate :per_page => 5, :page => page,
           :conditions => ['title LIKE ?', "%#{search}%"], :order => 'title'
		else
			paginate :per_page => 5, :page => page
		end
	end
end
