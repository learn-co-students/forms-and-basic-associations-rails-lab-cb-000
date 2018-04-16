class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # this is key??
  # attr_accessor :artist_name

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def artist_name
    #  couldve checked for nil earlier
    # not quite sure why this works
     if !self.artist.nil?
      self.artist.name
    end
   end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(contents)
    # no idea
     contents.each do |content|
       note = Note.find_or_create_by(content: content)
       self.notes << note
     end
   end

   def note_contents
    #  arr = []

    # guess that shit works lel
     ans = Note.all.collect do |i|
       i.content
     end

     ans.reject(&:empty?)
   end
end
