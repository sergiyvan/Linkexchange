class CreateCustomerCategories < ActiveRecord::Migration
  def change
    create_table :customer_categories do |t|
      t.integer :customer_id
      t.integer :category_id

      t.timestamps
    end
  end
end
