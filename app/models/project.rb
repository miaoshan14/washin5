class Project < ApplicationRecord
  has_many :participations
  has_many :financings
end
