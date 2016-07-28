module ProfilesHelper

  def recent_drivel(user)
      user.drivets.each do |drivet|
        if ((Time.now - drivet.created_at) / 86400) <= 6
           return drivet.message
       end
     end
  end

end
