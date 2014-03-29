class AddDefaultsToCustomers < ActiveRecord::Migration
  def change
    change_column_default :customers, :google_pr, -1
    change_column_default :customers, :yandex_tic, -1
  end
end
