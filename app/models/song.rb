class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(note_contents)
    note_contents.each do |note_content|
      self.notes << Note.create(content: note_content)
    end
  end

  def note_contents
    self.notes.any? ? self.notes.map { |note| note.content } : []
  end

end
