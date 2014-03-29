class CreatePartialKnownUrls < ActiveRecord::Migration
  def change
    create_table :partial_known_urls do |t|
      t.integer :partial_id
      t.integer :known_url_id

      t.timestamps
    end
  end
end
