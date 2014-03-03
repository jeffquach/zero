module ApplicationHelper
def full_title(pt)
    base = "Base"
    if pt.empty?
      base
    else
      "#{base} | #{pt}"
    end
  end
end
