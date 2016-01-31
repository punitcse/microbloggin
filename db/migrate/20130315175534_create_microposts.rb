class CreateMicroblogs < ActiveRecord::Migration
  def change
    create_table :Microblogs do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :Microblogs, [:user_id, :created_at]
  end
end
