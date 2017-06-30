class Artist < ApplicationRecord
  acts_as_taggable

  def self.search(term)
    all
  end
end
