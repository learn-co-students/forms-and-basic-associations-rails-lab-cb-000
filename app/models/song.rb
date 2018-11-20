class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_id=(genre_id)
    self.genre = Genre.find_by(id: genre_id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      if note_content != ""
        note = Note.create(content: note_content)
        self.notes << note unless note == nil
      end
    end
    self.save
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
