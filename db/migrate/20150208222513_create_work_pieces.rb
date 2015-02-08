class CreateWorkPieces < ActiveRecord::Migration
  def change
    create_table :work_pieces do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
