module CoursesHelper
  def generate_week_td(course)
    str = ["", "", "", "", "", "", "",""]
    course.coursetimes.each do |t|
      str[day_name_to_int(t.dayofweek)] = "#{t.start.strftime('%l:%M %P')} -- #{t.end.strftime('%l:%M %P')}"
    end
    str.shift
    return "<td>#{str.join("</td><td>")}</td>"
  end
  
  def day_name_to_int(day)
    case day
    when "Sunday"
      7
    when "Monday"
      1
    when "Tuesday"
      2
    when "Wednesday"
      3
    when "Thursday"
      4
    when "Friday"
      5
    when "Saturday"
      6
    end
  end
end
