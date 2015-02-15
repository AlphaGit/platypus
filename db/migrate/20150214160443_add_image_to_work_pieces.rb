class AddImageToWorkPieces < ActiveRecord::Migration
  def change
    add_attachment :work_pieces, :image
  end
end
