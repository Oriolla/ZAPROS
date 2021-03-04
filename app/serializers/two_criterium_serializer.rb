class TwoCriteriumSerializer < ActiveModel::Serializer
  attributes :id, :criteria1_id, :criteria2_id, :uses
end
