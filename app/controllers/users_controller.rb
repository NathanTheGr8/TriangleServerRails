class UsersController < ApplicationController
	before_action :set_user, only: [:show]

	def show
	  @user = User.find(params[:id])
	end

	private
	    def set_user
	      @dj = User.find(params[:id])
	    end

	    def user_params
	      params.require(:user).permit(:email, :first, :last, :middle, :avatar)
	    end
end
