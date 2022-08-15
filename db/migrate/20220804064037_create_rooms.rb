class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_introduction
      t.string :room_address
      t.integer :room_price
      t.string :room_image
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
