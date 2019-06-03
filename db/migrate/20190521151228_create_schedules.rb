class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :group
      t.integer :day
      t.string :teacher
	  t.string :classroom

      t.timestamps
    end
  end
end
