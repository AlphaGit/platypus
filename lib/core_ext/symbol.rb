class Symbol
  def as_readable_option
    self.to_s.gsub "_", " "
  end
end
