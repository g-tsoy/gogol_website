class AddTeacherToSchedule < ActiveRecord::Migration[5.2]
  def change
	add_reference :schedules, :teacher
  end
end
