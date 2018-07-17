class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end
 
   def genre_name
      self.genre ? self.genre.name : nil
   end
   
   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end
 
   def artist_name
      self.artist ? self.artist.name : nil
   end
   
  def note_contents=(notes_array)
    notes_array.each do |notes_string|
      if notes_string != ''
      self.notes.build(content: notes_string) 
    end
    end
  end
 
  def note_contents
      self.notes.map do |note|
        note.content
      end
  end
   
   
   
   
end


  # describe 'note_contents' do
  #   it 'returns the content of all notes as an array' do
  #     song = Song.new
  #     song.note_contents = ['hi', 'there']
  #     expect(song.note_contents).to eq ['hi', 'there']
  #   end
  # end

  # describe 'note_contents=' do
  #   it 'sets notes for a song' do
  #     song = Song.new
  #     notes = ['Great song', 'much bass', 'wow']
  #     song.note_contents = notes
  #     expect(song.notes.map(&:content)).to eq notes
  #   end
  #   it 'adds to existing notes' do
  #     song = Song.new
  #     notes = ['Great song']
  #     song.note_contents = ['Great song']
  #     expect(song.notes.map(&:content)).to eq notes
  #     notes << 'much bass'
  #     song.note_contents = ['much bass']
  #     expect(song.notes.map(&:content)).to eq notes
  #     notes << 'wow'
  #     song.note_contents = ['wow']
  #     expect(song.notes.map(&:content)).to eq notes
  #   end
  #   it 'ignores blank notes' do
  #     song = Song.new
  #     song.note_contents = ['', "i'm all alone", '', '']
  #     expect(song.note_contents).to eq ["i'm all alone"]
  #   end
  # end