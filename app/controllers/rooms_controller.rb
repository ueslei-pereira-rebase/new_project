class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    rooms = Room.private_rooms
    @users = Participant.people(rooms, current_user)
  end

  def create
    @room = Room.create(name: params[:name])
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @single_room = Room.find_by(name: name_room(@user,current_user))
    @rooms = Room.private_rooms 
    # @users = User.all_except(@current_user)
    @users = Participant.people(@rooms, current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages

    render "index"
  end

  private

  def name_room(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
