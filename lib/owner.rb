require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    save
  end

  def species
    @species = "human"
  end

  def say_species
     "I am a human."
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.collect do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.collect do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = []
    pets << dogs
    pets << cats
    pets.flatten.collect do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end