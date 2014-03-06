module ApplicationHelper
  def full_title(pt)
    mind = "MindMeetup"
    if pt.empty?
      mind
    else
      "#{mind} | #{pt}"
    end
  end

  def current_user?(user)
  	current_user == user
  end
end
