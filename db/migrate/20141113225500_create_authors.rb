class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :nick
      t.integer :posts_count

      t.timestamps
    end
  end
end
