class CreatePartials < ActiveRecord::Migration
  def change
    create_table :partials do |t|
      t.integer :f_customer_id
      t.integer :s_customer_id
      t.integer :t_customer_id
      t.text :partial_html

      t.timestamps
    end
  end
end
