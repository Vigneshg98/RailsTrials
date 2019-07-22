class UsersController < ApplicationController

	def index
        @users = User.all
        @user = User.new
	end

	def display
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

	def validate

		xname = params['user']['firstname']
		xemail = params['user']['email']

		flag = 0

		@users = User.all

		@users.each do |tmp|
			if tmp[:firstname] == xname && tmp[:email] == xemail
				flag = 1
				break
			end
		end
		if flag == 0
			redirect_to users_path
		else
			redirect_to choice_path
		end
	end

	def choice
		xn = params[:name]
		xe = params[:email]
		xc = params[:company]

		@nameAr = []
		@emailAr = []
		@companyAr = []

		@users = User.all

		flag = 1

		if xn == "1"
			@users.each do |tmp|
				@nameAr.push(tmp[:firstname])
			end
			flag = 0
		end
		if xe == "1"
			@users.each do |tmp|
				@emailAr.push(tmp[:email])
			end
			flag = 0
		end
		if xc == "1"
			@users.each do |tmp|
				@companyAr.push(tmp[:company])
			end
			flag = 0
		end

		puts @nameAr
		puts @emailAr
		puts @companyAr

		if flag == 0
			redirect_to display_path(@nameAr, @emailAr, @companyAr)
		end

	end

	private
  		def user_params
    		params.require(:user).permit(:firstname, :lastname, :email, :age, :company)
 		end

end