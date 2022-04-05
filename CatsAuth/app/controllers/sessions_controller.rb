class SessionsController < ApplicationController

    before_action :require_logged_out, only:[:new, :create]
    def new
        render :new # without this rails does this anyways
    end

    def create
        @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        if @user
            login!(@user)
            redirect_to cats_url
        else
            @user = User.new(user_name: params[:user][:user_name])
            render :new
        end
    end

    def destroy
        logout!
        redirect_to cats_url
    end
end