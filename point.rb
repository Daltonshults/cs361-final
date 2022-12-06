class Point

    attr_reader :lat, :lon, :ele
  
    def initialize(lon, lat, ele="")
      @lon = lon
      @lat = lat
      @ele = ele
    end
  end