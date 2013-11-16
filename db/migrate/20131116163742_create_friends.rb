class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :to_user_id
      t.boolean :status

      t.timestamps
    end
  end
end
