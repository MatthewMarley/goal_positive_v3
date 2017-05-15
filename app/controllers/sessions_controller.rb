class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        # If user exists (so returns true), and the user email matches the authenticated user password
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to root_path
        else
            # Use flash.now when using 'render', and use flash when using 'redirect_to'
            flash.now[:danger] = "There is something wrong with you log in information"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
    
end