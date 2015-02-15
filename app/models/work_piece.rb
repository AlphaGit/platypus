class WorkPiece < ActiveRecord::Base
  has_attached_file :image,
    :styles => {
      :small => "150x150>",
      :medium => "800x600>"
    }

  validates :title, presence: true
  validates :image, :presence => true,
    :attachment_content_type => { :content_type => /\Aimage\/.*\Z/ }
end
