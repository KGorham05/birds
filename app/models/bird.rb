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
    # Validations
    validates :common_name, :latin_name, presence: true
    # Custom Validations
    validates_with MyValidator
end
