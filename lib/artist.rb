class Artist
  
  attr_accessor :name

  @@all = []
  
  def initialize(name)
    self.name = name
    @songs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def initialize(name)
    self.name = name
  end
  
  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find(name)
    self.all.detect{|artist| artist.name == name}
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist
  end
  
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end
  
  def print_songs
    self.songs.each {|song| puts song.name}
  end

  def self.find_or_create_by_name(name)
    self.all.detect do |artist|
      if artist.name == nil
        artist.name = Artist.new(name)
      else
        artist.name
      end
    end
  end

end