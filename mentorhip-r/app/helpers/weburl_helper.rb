module WeburlHelper
  def url_with_protocol(weburl)
    /^http/.match(weburl) ? url : "http://#{weburl}"
  end
end