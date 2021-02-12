class Sighting < ApplicationRecord
    belongs_to :bird

    validates :lat, :long, :description, :bird_id, presence: true
end
