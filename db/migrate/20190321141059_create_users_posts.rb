class CreateUsersPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :users_posts do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.boolean :readed, default: false
    end

    add_index :users_posts, :user_id
    add_index :users_posts, :post_id
    add_index :users_posts, [ :post_id, :user_id ]
  end
end
