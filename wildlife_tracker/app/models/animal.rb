class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, :latin_name, presence: true
    validate :names_match

    def names_match
        if :common_name == :latin_name
            error.add(:latin_name, "Latin name cannot be the same as the common latin...because latin isn't common")
        end
    end

end
