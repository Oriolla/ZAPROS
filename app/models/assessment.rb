class Assessment < ApplicationRecord
  belongs_to :criteria, class_name: "Criterium",
      foreign_key: "criteria_id"

  has_many :requests11, class_name: "Request",
           foreign_key: "assessment11_id", dependent: :destroy
  has_many :requests12, class_name: "Request",
           foreign_key: "assessment12_id", dependent: :destroy

  has_many :requests21, class_name: "Request",
           foreign_key: "assessment21_id", dependent: :destroy
  has_many :requests22, class_name: "Request",
           foreign_key: "assessment22_id", dependent: :destroy

  has_many :nirs, class_name: "Nir",
             foreign_key: "assessment1_id", dependent: :destroy
  has_many :nirs, class_name: "Nir",
             foreign_key: "assessment2_id", dependent: :destroy
  has_many :nirs, class_name: "Nir",
             foreign_key: "assessment3_id", dependent: :destroy

  # get assessments array of arrays by given criterium_id
  scope :criteria_assessments, -> (id) { select('criteria_id').where(id: id) }


  # find assessment by id
  scope :find_assessment, -> (assessment_id) { find(assessment_id) }
end
