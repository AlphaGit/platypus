class AddBiographiesTable < ActiveRecord::Migration
  def self.up
    create_table :biographies do |t|
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :biographies
  end
end
