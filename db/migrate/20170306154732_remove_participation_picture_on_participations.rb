class RemoveParticipationPictureOnParticipations < ActiveRecord::Migration[5.0]
  def change
    remove_column :participations, :participation_picture
  end
end
