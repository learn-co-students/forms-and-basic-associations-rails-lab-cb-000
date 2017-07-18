class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  #  binding.pry
    self.artist = Artist.find_or_create_by(name: name)
    self.save
  end

  def artist_name
  self.try(:artist).try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.save
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(content)
#binding.pry
     content.each do |content|
       if content.strip != ""
    self.notes << Note.find_or_create_by(content: content)

  end
end
self.save
  end

  def note_contents
    #binding.pry
    self.notes.collect do |note|

      note.content
    end
  end

end
