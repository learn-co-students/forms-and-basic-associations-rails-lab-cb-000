class Song < ActiveRecord::Base
  has_many :notes
  
  belongs_to :genre
  belongs_to :artist
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    self.genre.name ? self.genre.name : nil
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist.name ? self.artist.name : nil
  end
  
  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ""
        self.notes.new(content: content)
      end
    end
  end
  
  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
  
end
