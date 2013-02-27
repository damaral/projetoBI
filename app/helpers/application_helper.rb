module ApplicationHelper
 def icons
    File.readlines('icons.txt')
  end

  def openwebicons
    File.readlines('openweb.txt')
  end

  def nav_active(options = {})
    a = request.path
    current_route = request.path.split("/")
    @primary = nil
    @secondary = nil
    if  current_route.count > 0
      @primary = current_route.first.split(".").first # dashboard
      @secondary = current_route.last.split(".").first
  end
    if options[:primary]
      return "active" if options[:primary] == @primary
    end

    if  options[:secondary]
      return "active" if options[:secondary] == @secondary
    end
  end
end