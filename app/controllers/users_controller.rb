class UsersController < ApplicationController

    def index
        @user = User.new
    end

    def new
        @User = User.new
    end

    def create
        @user = User.new(user_params)
        if (@user.save)
            session[:user_id] = @user.id
            flash[:success] = "You have successsfully created a new account"
            redirect_to root_path
        else 
            flash[:warning] = "User with that name already exists, try a different name"
            redirect_to new_user_path
        end 
    end

    def login
        begin
            user = User.find_by(name: params[:login][:name])
            session[:user_id] = user.id
        rescue
            flash[:warning] = "Invalid Login Info"
        end
        redirect_to root_path    
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
    
    def logged_in
        current_user
    end
    

    def user_params
        params.require(:user).permit(:name)
    end
    
end
