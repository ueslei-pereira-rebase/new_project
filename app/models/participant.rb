class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :room
  scope :people, ->(rooms, user) do 
    participants = where(room: rooms).where.not(user:user).map{|participant| participant.user_id}
    User.where(id: participants)
  end

end
