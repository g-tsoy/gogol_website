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
			photo = '/img/default_teacher.jpg'
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

	def edit
		@teacher = Teacher.find(params[:id])
	end

	def save
		if params[:teacher].key?(:photo)
			uploaded_io = params[:teacher][:photo]
			File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
			photo = '/uploads/' + uploaded_io.original_filename
		end
		@teacher = Teacher.update(params[:id], teacher_params)
		Teacher.update(params[:id], photo: photo) if photo
		if @teacher.save
			flash[:success] = "Teacher was updated"
			redirect_to admin_teachers_path
		else
			render 'edit'
		end
	end


	private

		def teacher_params
			params.require(:teacher).permit(:name, :subject, :description, :photo)
		end

end