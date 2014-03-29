class CreateKnownUrls < ActiveRecord::Migration
  def change
    create_table :known_urls do |t|
      t.text :url
      t.integer :customer_id
      t.integer :partial_id

      t.timestamps
    end
  end
end
