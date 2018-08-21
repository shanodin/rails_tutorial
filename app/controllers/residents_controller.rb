class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]

  # validate parameters for security
  def resident_params
    params.require(:resident).permit(:name, :age)
  end

  # GET all residents
  def index
    @residents = Resident.all
  end

  # GET specific resident and their room
  def show
    @resident = find(params[:id])
    @room = Room.find(@resident.room_id).number
  end

  # GET page to create a new resident
  def new
    @resident = Resident.new()
    @all_rooms = Room.all()
  end

  # GET edit specific resident
  def edit
    @resident = Resident.find(params[:id])
    @all_rooms = Room.all()
  end

  # POST save a new resident
  def create
    @resident = Resident.create(resident_params)
    redirect_to '/residents'
  end

  # PATCH/PUT save edit to specific resident
  def update
    resident = Resident.find(params[:id])
    resident.update_attributes(resident_params)
    redirect_to action: 'show', id: resident.id 
  end

  # DELETE specific resident
  def destroy
    resident = Resident.find(params[:id])
    resident.destroy!
    redirect_to '/residents'
  end

end
