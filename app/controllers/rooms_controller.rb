class RoomsController < ApplicationController
  def index
    @rooms = Room.public_rooms
  end

  def create
    @room = Room.create(name: params[:name])
  end
end
