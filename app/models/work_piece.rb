class WorkPiece < ActiveRecord::Base
  validates :title, presence: true
end
