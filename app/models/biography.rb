class Biography < ActiveRecord::Base
  def self.get_single_or_default
    biography = self.first
    biography ||= self.new(:content => '<em>(No biography yet)</em>')
  end
end
