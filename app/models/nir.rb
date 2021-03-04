class Nir < ApplicationRecord
  belongs_to :university, class_name: "University",
             foreign_key: "university_id"

  belongs_to :assessment1, class_name: "Assessment",
           foreign_key: "assessment1_id"
  belongs_to :assessment2, class_name: "Assessment",
             foreign_key: "assessment2_id"
  belongs_to :assessment3, class_name: "Assessment",
             foreign_key: "assessment3_id"

  # find nir by id
  scope :find_nir, -> (nir_id) { find(nir_id) }

  #attr_accessor nir1
  def my_comparator(nir2)
    nir_a = [self.assessment1.rang, self.assessment2.rang, self.assessment3.rang].sort
    nir_b = [nir2.assessment1.rang, nir2.assessment2.rang, nir2.assessment3.rang].sort
    nir_a_more = 0
    nir_b_more = 0
    for i in 0..nir_a.count-1
      if nir_a[i] > nir_b[i]
        nir_a_more += 1
      elsif nir_a[i] < nir_b[i]
        nir_b_more += 1
      end
    end
    nir_a_more <=> nir_b_more
  end


end
