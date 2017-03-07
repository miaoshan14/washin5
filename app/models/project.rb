class Project < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :financings

  def last_participations(project_id)
    # project = Project.find(project_id)
    Participation.last(16).reverse
  end

  def user_count

  end
end
