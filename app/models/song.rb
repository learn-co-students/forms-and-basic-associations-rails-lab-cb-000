class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #essentially these are methods to help form fillout be easier for user
  #here i am defining my own setter and getter methods
  #this helps clear up and simplify my controllers

  def genre_name=(name) #setter method (is called whenever a genre is initialized)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name #getter method
    self.try(:genre).try(:name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
