class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre ||= Genre.create
    genre.name = name
  end

  def genre_name
    genre.name
  end

  def artist_name=(name)
    self.artist ||= Artist.create
    artist.name = name
  end

  def artist_name
    artist.name
  end

  def note_contents
    contents = notes.pluck(:content)

    contents.empty? ? notes.map(&:content) : contents
  end

  def note_contents=(contents)
    contents.each do |content|
      notes.build(content: content) unless content.empty?
    end
  end
end
