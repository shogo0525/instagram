class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture
      t.timestamps null: false
    end
  end
end
