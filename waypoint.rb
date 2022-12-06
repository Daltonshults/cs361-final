

class Waypoint
attr_reader :lat, :lon, :ele, :name, :type, :printer

  def initialize(lon, lat, ele=nil, name=nil, type=nil, printer)
    @lat = lat
    @lon = lon
    @ele = ele
    @name = name
    @type = type
    @printer = printer
  end

  def to_json(indent=0)
    printer.to_json(indent, self)
  end
end
