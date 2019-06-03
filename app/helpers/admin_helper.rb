module AdminHelper
	def login_required
		if current_user
			return
		end

		flash[:warning]='Please login to continue'
		redirect_to('/login')
	end
end
