class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :gender
      t.string :edition
      t.string :year

      t.timestamps
    end
  end
end
