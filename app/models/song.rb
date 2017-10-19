class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre == nil
      return ""
    else
      self.genre.name
    end
  end

  def artist_name
    if self.artist == nil
      return ""
    else
      self.artist.name
    end
  end

  def note_contents=(ids)
    arr = []
    ids.each do |id|
      if !(id == "")
        note = Note.create(content: id)
        arr << note
        self.notes << note
        self.save
      end
    end

  end

  def note_contents
    arr = []
    self.notes.all.each do |n|
      arr << n.content
    end
    arr
  end
end
