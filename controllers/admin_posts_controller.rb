class AdminPostsController < AdminController
	layout 'admin'

	before_action :login_required

	def index
		@posts = Micropost.all
	end

	def new
		@post = Micropost.new
	end

	def create
        if params[:micropost].key?(:cover)
  		    uploaded_io = params[:micropost][:cover]
		    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
		      file.write(uploaded_io.read)
		    end
		    cover = '/uploads/' + uploaded_io.original_filename
        else
            cover = ''
        end
		@post = Micropost.new(post_params)
		@post.cover = cover
        if @post.save
			flash[:success] = "Post was created"
			redirect_to admin_posts_path
		else
			# flash[:danger] = "Something went wrong"
			render 'new'
		end
	end

	def destroy
		Micropost.find(params[:id]).destroy
		redirect_to admin_posts_path
	end


	private

		def post_params
			params.require(:micropost).permit(:name, :content, :cover)
		end

end
