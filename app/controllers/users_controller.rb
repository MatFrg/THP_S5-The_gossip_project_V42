class UsersController < ApplicationController

def new
	@cities = City.all

end

def create
	@user = User.new('first_name' => params[:first_name],
    							'last_name' => params[:last_name],
    							'description' => params[:description],
    							'email' => params[:email],
    							'age' => params[:age],
    							'city_id' =>params[:city_id] ,#City.find_by(name: params[:city_id].to_s).id
    							'password' => params[:password])

	

	if @user.save
    	log_in(@user)
        redirect_to gossips_path
    else 
    	render 'user/new'
    end
end

end
