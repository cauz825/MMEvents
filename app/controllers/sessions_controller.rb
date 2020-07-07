class SessionsController < ApplicationController
    def home
        @events = Event.all
    end

    def login
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            render :login
        end
    end
end