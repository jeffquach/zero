module ApplicationHelper
def full_title(pt)
    mind = "MindMeetup"
    if pt.empty?
      mind
    else
      "#{mind} | #{pt}"
    end
  end
end
