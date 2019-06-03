class ApplicationController < ActionController::Base

	def index
		@news = Micropost.order(:id).limit(10).reverse_order
	end

	def about
	end
  
	def contacts
	end

	def teachers
		@teachers = Teacher.all
	end

	def reviews
	end

	def schedule
		@groups = Schedule.select(:group).map(&:group).uniq
		@lessons = []
	end

	def filledschedule
		@groups = Schedule.select(:group).map(&:group).uniq
		@lessons = Schedule.where(group: params[:group])
		render 'application/schedule'
	end

	def view
		@post = Micropost.find(params[:id])
	end

	include SessionsHelper
end
