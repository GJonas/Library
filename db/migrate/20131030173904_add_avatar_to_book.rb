class AddAvatarToBook < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.has_attached_file :books, :avatar
    end
  end

  def self.down
    drop_attached_file :books, :avatar
  end
end

