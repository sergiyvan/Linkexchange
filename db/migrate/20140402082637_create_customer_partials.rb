class CreateCustomerPartials < ActiveRecord::Migration
  def change
    create_table :customer_partials do |t|
      t.integer :customer_id
      t.integer :partial_id

      t.timestamps
    end
  end
end
