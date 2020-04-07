class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name:artist_name)
  end


  def artist_name
    artist.try(:name)
  end

end
