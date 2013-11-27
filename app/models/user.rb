class User < ActiveRecord::Base
	 has_many :loans, dependent: :destroy
	 
  
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,	format:{ with: VALID_EMAIL_REGEX },
	                                    uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
         Digest::SHA1.hexdigest(token.to_s)
    end
    def self.search(search, page)
		if search
			paginate :per_page => 5, :page => page,
           :conditions => ['name LIKE ?', "%#{search}%"], :order => 'name'
		else
			paginate :per_page => 5, :page => page
		end
	end

    private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
