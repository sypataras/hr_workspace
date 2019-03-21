class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.string :text, null: false, default: ""
      t.attachment :photo
      t.attachment :document
      t.timestamps null: false
    end

    add_index :posts, :title, unique: true
  end
end
