class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :room
  scope :people, ->(rooms, user) do 
    rooms_private_id = where(room: rooms).where(user:user).map{|participant| participant.room_id}
    participants = where(room: rooms_private_id).where.not(user:user).map{|participant| participant.user_id}
    User.where(id: participants)
  end

end
