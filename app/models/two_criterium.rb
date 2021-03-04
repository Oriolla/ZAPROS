class TwoCriterium < ApplicationRecord
  belongs_to :criteria1, class_name: "Criterium",
             foreign_key: "criteria1_id"
  belongs_to :criteria2, class_name: "Criterium",
             foreign_key: "criteria2_id"
end
