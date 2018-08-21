module ResidentsHelper

  def options_for_select(rooms)
    (rooms.map { |room| [room.room_name, room.id] })
  end

  def resident_view_button(resident)
    button_to 'View', resident_path(:id => resident.id), :method => :get
  end

  def resident_edit_button(resident)
    button_to "Edit", edit_resident_path(:id => resident.id), :method => :get
  end

  def resident_delete_button(resident)
    button_to "Delete", resident_path(:id => resident.id), :method => :delete
  end

end
