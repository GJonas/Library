class UsersController < ApplicationController

	before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
	
	before_action :correct_user,   only: [:edit, :update]

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			 sign_in @user
			
			flash[:success] = "Welcome to Library!"
			redirect_to @user
		else
			render 'new'
		end
	end
	 
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to :users
	end


	private
	def user_params
		params.require(:user).permit(:avatar, :name, :email, :phone, :password,
			:password_confirmation)
	end
end
