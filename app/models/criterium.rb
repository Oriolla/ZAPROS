class Criterium < ApplicationRecord
  has_many :assessments, class_name: "Assessment",
           foreign_key: "criteria_id", dependent: :destroy

  has_many :criterias1, class_name: "TwoCriterium",
           foreign_key: "criteria1_id", dependent: :destroy
  has_many :criterias2, class_name: "TwoCriterium",
           foreign_key: "criteria2_id", dependent: :destroy
end
