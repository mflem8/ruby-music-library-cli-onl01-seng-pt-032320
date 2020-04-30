class Song

  attr_accessor :name
  attr_reader :artist, :genre

    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def add_song

  end

  def genres

  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)

  end

  def self.new_from_filename

  end

  def self.create_from_filename

  end

end
