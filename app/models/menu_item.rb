class MenuItem < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true

  def self.all_for_display
    @@all_for_display ||= MenuItem.all
  end

  def self.reload_all_for_display
    @@all_for_display = MenuItem.all
  end
end
