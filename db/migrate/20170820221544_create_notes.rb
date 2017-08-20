class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.string :name, null: false
    	t.integer :user_id, null: false

    	t.integer :download_count, null: false, default: 0
    	t.string :url, null: false

    	t.timestamps null: false
    end
  end
end
