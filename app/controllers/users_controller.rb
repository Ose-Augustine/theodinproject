class UsersController < ApplicationController
    def new
        @user = User.new 
    end

    def create
        @user = User.new(username: params[:user][:fname], 
            email: params[:user][:email], 
            password: params[:user][:password])
        
        if @user.save
            redirect_to new_user_path 
        else
            render :new, status: :unprocessable_entity
        end
    end

end
