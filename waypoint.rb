class Waypoint

    attr_reader :lat, :lon, :ele, :name, :type, :printer

    def initialize(lon, lat, ele=nil, name=nil, type=nil, printer)
      @lat = lat
      @lon = lon
      @ele = ele
      @name = name
      @type = type
      @printer = printer

      # Handling Nil parameters so they
      # Don't continue through the whole
      # Program
      if name.nil?
        @name = ""
      end

      if ele.nil?
        # Highest elevation on Earth 27k
        @ele = 300000
      end

      if type.nil?
        @type = ""
      end

    end

  def to_json(indent=0)
    printer.to_json(indent, self)
  end
end
