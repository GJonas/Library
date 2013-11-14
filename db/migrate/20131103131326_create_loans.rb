class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.date :data
      t.belongs_to :user
      t.belongs_to :book
      t.string :status, default: "open"

      t.timestamps
    end
    add_index :loans, [:user_id, :created_at]
    add_index :loans, [:book_id, :created_at]
  end
end
