class AddAdminUsersAndColorsCategories < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, default: false
    add_column :categories, :color, :string
  end

  def self.down
    remove_column :users, :admin
    remove_column :categories, :color
  end
end
