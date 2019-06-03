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

		if Schedule.where(group: @schedule.group, lesson: @schedule.lesson, day: @schedule.day).count != 0
			flash[:danger] = "This group already has lesson in this time"
			render 'new'
			return
		end
		
		if @schedule.save
			flash[:success] = "Schedule item was created"
			redirect_to admin_schedule_path
		else
			render 'new'
		end
	end

	def destroy
		Schedule.find(params[:id]).destroy
		redirect_to admin_schedule_path
	end

	def edit
		@schedule = Schedule.find(params[:id])
	end

	def save
		@schedule = Schedule.find(params[:id])
		if Schedule.where(group: params[:schedule][:group],
						  lesson: params[:schedule][:lesson],
						  day: params[:schedule][:day]).count != 0
			flash[:danger] = "This group already has lesson in this time"
			render 'edit'
			return
		end

		@schedule = Schedule.update(params[:id], schedule_params)
		if @schedule.save
			flash[:success] = "Schedule was updated"
			redirect_to admin_schedule_path
		else
			render 'edit'
		end
	end

	private

		def schedule_params
			params.require(:schedule).permit(:group, :day, :lesson, :classroom, :teacher_id)
		end

end