class AddUserToMicropost < ActiveRecord::Migration[5.2]
  def change
	add_reference :microposts, :user
  end
end
