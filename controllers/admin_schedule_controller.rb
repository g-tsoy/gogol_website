class AdminScheduleController < AdminController
	layout 'admin'

	before_action :login_required

	def index
		@schedules = Schedule.all
	end

	def new
		@schedule = Schedule.new
	end

	def create
		@schedule = Schedule.new(schedule_params)
		if @schedule.save
			flash[:success] = "Schedule item was created"
			redirect_to admin_schedule_path
		else
			flash[:danger] = "Something went wrong"
			redirect_to admin_schedule_new_path
		end
	end

	def destroy
		Schedule.find(params[:id]).destroy
		redirect_to admin_schedule_path
	end


	private

		def schedule_params
			params.require(:schedule).permit(:group, :day, :lesson, :classroom, :teacher_id)
		end

end