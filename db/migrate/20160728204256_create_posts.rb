class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.timestamps
    end

    add_index :posts, :created_at
  end
end
