class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new()
    all << song
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
     song = Song.new()
     song.name = name
     song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    @@all = @@all.sort{|a,b| a.name <=> b.name}
  end
  
  def self.new_from_filename(song_and_artist)
    arr = song_and_artist.split(" - ")
    artist, name = arr[0], arr[1].gsub(".mp3", "")
    song = find_or_create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(song_and_artist)
    new_from_filename(song_and_artist)
  end

  def self.destroy_all
    @@all = []
  end
end