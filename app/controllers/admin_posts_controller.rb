class AdminPostsController < AdminController
	layout 'admin'

	before_action :login_required

	def index
		@posts = Micropost.order(:id).reverse_order
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
            cover = '/img/default_post.jpg'
        end
		@post = Micropost.new(post_params)
		@post.user = @current_user
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

	def edit
		@post = Micropost.find(params[:id])
	end

	def save
		if params[:micropost].key?(:cover)
			uploaded_io = params[:micropost][:cover]
			File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
			cover = '/uploads/' + uploaded_io.original_filename
		end
		@post = Micropost.update(params[:id], post_params)
		Micropost.update(params[:id], cover: cover) if cover
		if @post.save
			flash[:success] = "Post was updated"
			redirect_to admin_posts_path
		else
			render 'edit'
		end
	end


	private

		def post_params
			params.require(:micropost).permit(:name, :content, :cover)
		end

end
