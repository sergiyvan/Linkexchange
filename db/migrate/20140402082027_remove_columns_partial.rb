class RemoveColumnsPartial < ActiveRecord::Migration
  def change
	remove_column :partials, :f_customer_id
	remove_column :partials, :s_customer_id
	remove_column :partials, :t_customer_id
  end
end
