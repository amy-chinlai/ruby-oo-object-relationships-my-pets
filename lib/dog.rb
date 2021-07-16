class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end


end