class UsersController < ApplicationController

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
			redirect_to @user
			flash[:success] = "Welcome to Library!"
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
