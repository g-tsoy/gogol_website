class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.text :content
      t.string :name
      t.string :cover

      t.timestamps
    end
  end
end
