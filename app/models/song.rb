class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by(name: artist_name)
    self.update(artist: artist)
  end

  def artist_name
    if self.artist_id == nil
      nil
    else
      self.artist.name
    end
  end
end
