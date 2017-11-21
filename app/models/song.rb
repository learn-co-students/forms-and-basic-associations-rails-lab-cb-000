
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    #self is a song
    self.artist.name




  end

  def note_contents
    #expect returns content of all notes as an array
    arr = []
    self.notes.each do |note|
      arr << note.content
    end
    arr
  end

  def note_contents=(contents)
    #expect add to existing notes

    contents.each do |content|
      if content != ""
        note = Note.new(content: content, song: self )
        self.notes << note
      end
    end
  end
end
