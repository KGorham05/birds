class Bird < ApplicationRecord
    # Associations
    has_many :sightings
    # Validations
    validates :common_name, :latin_name, presence: true
end
