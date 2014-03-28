class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :webadress, null: false
      t.string :acc_type, null: false, default: "basic"
      t.string :access_key, null: false
      t.boolean :is_active, null: false, default: false
      t.integer :google_pr, null: false
      t.integer :yandex_tic, null: false

      t.timestamps  
    end
	
	add_index :customers, :name, unique: true
	add_index :customers, :webadress, unique: true
	add_index :customers, :access_key, unique: true
  end
end
