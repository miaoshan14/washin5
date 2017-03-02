class Participation < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_attachments :participation_pictures, maximum: 2
end
