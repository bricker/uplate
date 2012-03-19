class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text     "caption"
      t.string   "asset_file_name"
      t.string   "asset_content_type"
      t.integer  "asset_file_size"
      t.datetime "asset_updated_at"
      t.timestamps
    end
  end
end
