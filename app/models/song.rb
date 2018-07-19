class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name= (name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist && self.artist.name
  end

  def genre_name= (name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre && self.genre.name
  end

  #  Expects contents to be an array. 
  # Each element of the array represents a note
  def note_contents= (contents)
    contents.each do |content| 
      unless content.empty?
        notes << Note.new(content: content)
      end
    end
  end

  # return the contents of all the notes in an array
  def note_contents
    notes.map { |note| note.content }
  end

  def genre_name
    self.genre && self.genre.name
  end
end

