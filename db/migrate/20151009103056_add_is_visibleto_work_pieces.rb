class AddIsVisibletoWorkPieces < ActiveRecord::Migration
  def change
    add_column :work_pieces, :is_visible, :boolean, :default => true, :null => false
  end
end
