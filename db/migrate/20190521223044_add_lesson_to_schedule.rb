class AddLessonToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :lesson, :integer
  end
end
