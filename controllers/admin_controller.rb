class AdminController < ApplicationController
	layout 'admin'

	before_action :login_required

	def index
	end

	include AdminHelper
end
