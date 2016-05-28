class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :img_url
      t.string :thumb_url
      t.string :server_url
      t.integer :user_id
      t.integer :like_count, :default => 0
      t.integer :reply_count, :default => 0

      t.timestamps null: false
    end
  end
end
