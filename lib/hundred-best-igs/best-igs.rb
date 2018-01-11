require 'pry'

class HundredBestIgs::BestIgs

  attr_accessor :name, :summary, :posts, :followers, :following, :follow_url

  @@all = []

  def initialize(name = nil, follow_url = nil)
    @name = name
    @follow_url = follow_url
    @@all << self
  end

  def self.all
    @@all.uniq
  end

  def self.find_by_name(name)

  end

  def self.find_by_number(number)

  end
end
