class MyValidator < ActiveModel::Validator
    def validate(record)
        if record.common_name == record.latin_name
            record.errors.add :common_name, " must be different from Latin name"
        end
    end
  end

class Bird < ApplicationRecord
    # Associations
    has_many :sightings
    accepts_nested_attributes_for :sightings
    # Validations
    validates :common_name, :latin_name, presence: true, uniqueness: { case_sensitive: false,
        scope: [:latin_name, :common_name], message: "must be unique"}
    # Custom Validations
    validates_with MyValidator
end
