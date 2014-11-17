class CreateChatRooms < ActiveRecord::Migration
  def change
    create_table :chat_rooms do |t|
      t.string :name
      t.boolean :publicity
      t.integer :user_id

      t.timestamps
    end
  end
end
