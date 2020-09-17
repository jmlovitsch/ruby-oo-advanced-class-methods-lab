require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
    #instantiates and saves the song, and it returns the new song that was created (FAILED - 1)
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song

    #instantiates a song with a name property (FAILED - 2)

  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
   #instantiates and saves a song with a name property (FAILED - 3)

  end

  def self.find_by_name(name)
      self.all.find{|song| song.name == name}
    # can find a song present in @@all by name (FAILED - 4)
    # returns falsey when a song name is not present in @@all (FAILED - 5)
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
    # invokes .find_by_name and .create_by_name instead of repeating code (FAILED - 6)
    # returns the existing Song object (doesn't create a new one) when provided the title of an existing Song (FAILED - 7)
    # creates a new Song object with the provided title if one doesn't already exist (FAILED - 8)

  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
    # returns all the song instances in alphabetical order by song name (FAILED - 9)

  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
    # initializes a song and artist_name based on the filename format (FAILED - 10)

  end

  def self.create_from_filename(filename)
      result = self.new_from_filename(filename)
      song = self.create
      song.name = result.name
      song.artist_name = result.artist_name
      song
    # initializes and saves a song and artist_name based on the filename format (FAILED - 11)

  end

  def self.destroy_all
    self.all.clear
  end

end
