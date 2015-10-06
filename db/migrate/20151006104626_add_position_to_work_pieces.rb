class AddPositionToWorkPieces < ActiveRecord::Migration
  def change
    add_column :work_pieces, :position, :integer
  end
end
