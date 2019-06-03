MASTER_PASSWORD = 'mastermaster'

class UsersController < ApplicationController
  def new
	@user = User.new
  end

  def create
	@user = User.new(user_params)
	
	if params[:user][:master_password] != MASTER_PASSWORD
		flash[:danger] = "Master password doesnt match"
		render 'new'
		return
	end

	if @user.save	
	  log_in @user
      flash[:success] = "Welcome to the School App!"
      redirect_to '/'
	else
      render 'new'
    end
  end

  def view
	@user = User.find(params[:id])
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
