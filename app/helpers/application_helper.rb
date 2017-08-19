module ApplicationHelper
  def timeago(time, options = {})
    return unless time
    options[:class] = 'timeago' if time > 12.hours.ago # only fuzzy last 12 hours
    time_utc = time.getutc.iso8601
    time_format = time.strftime("%B #{time.day.ordinalize}, %Y at %I:%M%P")
    content_tag(:time, time_format.to_s, options.merge(datetime: time_utc, title: time_format))
  end
end
