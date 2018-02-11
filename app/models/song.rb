class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  validates :title, :artist, presence: true

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless self.artist == nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def note_contents=(notes)
    notes.reject(&:blank?).each do |note|
      n = Note.find_or_create_by(content: note)
      self.notes << n
    end
  end
end
