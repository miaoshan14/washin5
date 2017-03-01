class Participation < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_attachment :participation_picture
end
