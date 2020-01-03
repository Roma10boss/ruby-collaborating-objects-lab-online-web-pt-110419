class Song 
  attr_accessor :artist, :name   
  @@all = []
  
  def initialize(name)
    @name = name 
    save 
  end 
  
  def save 
    @@all << self 
  end 
  
  
  def self.all
    #Artist.all 
    @@all 
  end 
  
  def self.new_by_filename(file_name)
    artist = file_name.split(" - ")[0]
    song_title = file_name.split(" - ")[1]
    song = self.new(song_title)
    song.artist_name = artist
    song 
  end 
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self) 
  end 
end 