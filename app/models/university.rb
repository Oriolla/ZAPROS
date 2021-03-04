class University < ApplicationRecord
  has_many :nirs, class_name: "Nir",
             foreign_key: "university_id", dependent: :destroy
end
