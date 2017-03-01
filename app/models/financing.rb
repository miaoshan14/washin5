class Financing < ApplicationRecord
  belongs_to :project
  belongs_to :partner
end
