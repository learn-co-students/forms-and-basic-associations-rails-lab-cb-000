class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    # binding.pry
    self.notes.map { |n| n.content }
  end

  def note_contents=(note_content)
    binding.pry
    note_content.each do |n|
      note = Note.create(content: n)
      self.notes << note
    end
  end

end
