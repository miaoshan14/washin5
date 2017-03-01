class Project < ApplicationRecord
  has_many :financings
  has_many :participations
end
