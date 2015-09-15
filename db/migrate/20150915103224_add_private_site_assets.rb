class AddPrivateSiteAssets < ActiveRecord::Migration
  def change
    create_table :site_assets do |t|
      t.attachment :image
      t.string :file_name
      t.timestamps null: false
    end
  end
end
