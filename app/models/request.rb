class Request < ApplicationRecord
  belongs_to :assessment11, class_name: "Assessment",
             foreign_key: "assessment11_id"
  belongs_to :assessment12, class_name: "Assessment",
             foreign_key: "assessment12_id"

  belongs_to :assessment21, class_name: "Assessment",
             foreign_key: "assessment21_id"
  belongs_to :assessment22, class_name: "Assessment",
             foreign_key: "assessment22_id"

end
