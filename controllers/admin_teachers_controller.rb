class AdminTeachersController < AdminController
	layout 'admin'

	before_action :login_required

	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new
	end

	def create
		if params[:teacher].key?(:photo)
			uploaded_io = params[:teacher][:photo]
			File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
			photo = '/uploads/' + uploaded_io.original_filename
		else
			photo = ''
		end
		@teacher = Teacher.new(teacher_params)
		@teacher.photo = photo
		if @teacher.save
			flash[:success] = "Teacher was added"
			redirect_to admin_teachers_path
		else
			render 'new'
		end
	end

	def destroy
		Teacher.find(params[:id]).destroy
		redirect_to admin_teachers_path
	end


	private

		def teacher_params
			params.require(:teacher).permit(:name, :subject, :description, :photo)
		end

end