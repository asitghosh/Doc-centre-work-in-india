class String
  def pathsafe
    self.downcase.gsub(/[^a-zA-Z0-9\-_\/\.]+/i, "-")
  end

  def to_bool
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end