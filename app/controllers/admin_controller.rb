class AdminController < ApplicationController
	layout 'admin'

	before_action :login_required

	def index
	end

	def destroy
		if params[:id] == @current_user.id
			User.find(params[:id]).destroy
			redirect_to admin_users_path
		end
	end

	include AdminHelper
end
