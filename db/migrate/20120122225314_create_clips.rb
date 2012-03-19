class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.text     "title"
      t.text     "description"
      t.text     "video_embed_code"
      t.timestamps
    end
  end
end
