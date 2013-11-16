class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :status_update_id
      t.integer :user_id
      t.text :body
      t.datetime :timestamp

      t.timestamps
    end
  end
end
