class Artist < ApplicationRecord
  acts_as_taggable

  def self.search(term)
    where("name LIKE ?", "%#{term}%")
  end
end
