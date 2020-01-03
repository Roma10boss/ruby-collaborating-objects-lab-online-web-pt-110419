class Artist 
  
  attr_accessor :name, :song  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def add_song(song)
    song.artist = self 
    @songs << song 
  end 
  
  def songs 
    #singer.songs #=> give me all the songs by that artist 
    Song.all.select do |song|
      song.artist == self 
    end 
  end 
  

  def self.find_or_create_by_name(name)
      self.all.detect { |artist| artist.name == name } || artist = self.new(name)
  end 
  
  def print_songs 
    #singer.print_songs #=> prints all the singer's songs 
    songs.each do |song|
      puts song.name  
    end 
  end   
end