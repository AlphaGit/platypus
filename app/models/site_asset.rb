class SiteAsset < ActiveRecord::Base
  has_attached_file :image
  validates :file_name, presence: true
  validates :image, :presence => true,
    :attachment_content_type => { :content_type => /\Aimage\/.*\Z/ }
end
