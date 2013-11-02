class Book < ActiveRecord::Base
	#attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	#has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates :title, presence: true
	validates :author, presence: true
end
