class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password
	validates :email, :password, presence: true
	validates :email, uniqueness: true
	has_many :items

	def self.confirm(params)
	    @user = User.find_by({email: params[:email]})
	    @user.try(:authenticate, params[:password])
  	end
end
