class CreateGroupsPosts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :groups, :posts do |t|
      t.index [:post_id, :group_id]
      t.index [:group_id, :post_id]
    end
  end
end
