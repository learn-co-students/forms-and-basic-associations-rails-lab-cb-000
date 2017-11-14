class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless !self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name unless !self.genre
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.create(content: content) unless content.empty?
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end
end
