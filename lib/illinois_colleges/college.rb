
class College
  attr_accessor :name, :location, :size, :type, :url, :details
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
