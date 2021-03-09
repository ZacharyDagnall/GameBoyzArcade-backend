class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create(user_params) 
        render json: @user
    end

    def nextgame
        @user = User.find(params[:id])
        @game = @user.next_game(params[:name])
        render json: @game
    end

    def scores
        @user = User.find(params[:id])
        @scores = @user.scores
        render json: @scores
    end


    private 
    
    def user_params
        params.permit(:name)
    end

end

