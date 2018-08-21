class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # validate parameters for security
  def room_params
    params.require(:room).permit(:number)
  end

  def home
  end

  def index
    @rooms = Room.all()
    @residents = Resident.all()
  end

  # GET all rooms
  def index
    @rooms = Room.all
  end

  # GET specific room and its residents
  def show
    @room = Rooms.find(params[:id])
    in_room = []
      for resident in Resident.all do
        if (@room.id === resident.room_id)
          @in_room.push(resident)
        end
      end
  end

  # GET page to create a new room
  def new
    @room = Room.new
  end

  # GET edit specifc room
  def edit
    @room = Room.find(params[:id])
  end

  # POST save new room
  def create
    @room = Room.create(room_params)
    redirect_to '/rooms'
  end

  # PATCH/PUT save edit to specific room
  def update
    room = Room.find(params[:id])
    room.update_attributes(room_params)
    redirect_to action: 'show', id: room.id 
  end

  # DELETE specific room
  def destroy
    room = Room.find(params[:id])
      for resident in Resident.all do
        if (room.id === resident.room_id)
          resident.update_attributes({room_id: 1})
        end
      end
    room.destroy!
    redirect_to '/rooms'
  end

end
