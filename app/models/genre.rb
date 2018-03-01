class Genre < ActiveRecord::Base
  has_many :songs

  validates_presence_of :name
end
