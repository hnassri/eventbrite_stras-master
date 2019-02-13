module EventHelper
  def is_participate?
    if Attendance.where(user_id: current_user).count == 0 
      false
    else
      true
    end
  end
end
