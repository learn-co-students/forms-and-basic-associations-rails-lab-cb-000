class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
end


def artist_name
  self.artist ? self.artist.name : nil
end

end
