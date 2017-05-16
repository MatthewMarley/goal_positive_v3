class UpdatesController < ApplicationController
    
    def new
        @update = StatusUpdate.new
    end
    
    def create
        @update = StatusUpdate.new(update_params)
        if @update.save
            flash[:success] = "Your update has been added to your timeline"
            redirect_to users_path
        else
            flash.now[:danger] = "Your update was unable to be saved"
            render 'new'
        end
    end
    
    
    
    private
    def update_params
        params.require(:status_update).permit(:date, :title, :update_description) 
    end
    
    
end