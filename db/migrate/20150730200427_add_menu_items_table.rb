class AddMenuItemsTable < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.string :title
      t.string :link
    end
  end

  def self.down
    drop_table :menu_items
  end
end
