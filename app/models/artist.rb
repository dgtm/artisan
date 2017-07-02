class Artist < ApplicationRecord
  acts_as_taggable

  scope :with_name_like, -> (term) {
    where("name LIKE ?", "%#{term}%")
  }

  scope :with_tags_like, -> (term) {
    tagged_with(term, wild: true)
  }

  # @param [String] search_params
  # @return [<Artist>] Collection of artists
  def self.search(search_term)
    return all unless search_term.present?

    # Native Rails 5 'OR' query posing problems.
    # TODO Find a way to unite two scopes more elegantly since find_by_sql seems to return an Array and not an AR object.
    find_by_sql("((#{with_name_like(search_term).to_sql}) UNION (#{with_tags_like(search_term).to_sql}))")
  end

  # @param [String] search_params
  # @return [<ActsAsTaggableOn::Tag>] Collection of tags
  def self.suggestions_for(term)
    tag_counts.where("name LIKE ?", "%#{term}%")
  end

  def create_location(location_name)
    return true
    # TODO Geocode with geokit and save lat, lon as well
    # Location.create(name: location_name) if location_name.present?
  end

end
