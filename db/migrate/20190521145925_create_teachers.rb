class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :subject
	  t.string :photo
	  t.text :description

      t.timestamps
    end
  end
end
