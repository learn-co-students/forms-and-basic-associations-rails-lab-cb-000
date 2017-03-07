class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    genre && genre.name
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def artist_name
    artist && artist.name
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents=(contents)
    valid_contents = contents.reject {|c| c.empty?}
    valid_contents.map do |c|
      notes << Note.find_or_create_by(content: c, song: self)
    end
  end

  def note_contents
    notes.map(&:content)
  end
end

