class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # this is key
  attr_accessor :artist_name, :note_contents

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

  #  def artist_name
  #     self.artist.name
  #  end

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

     ans
   end
end
