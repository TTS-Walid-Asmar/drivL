module ApplicationHelper
  def nav_name(user)
    if user.username != nil
      return user.username
    elsif user.name != nil
      return user.name
    else
      return user.email
    end
  end
end
