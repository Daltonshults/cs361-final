class Track

    attr_reader :name, :segments, :printer
  
    def initialize(segments, name="", printer)
      @name = name
      @segments = segments
      @printer = printer
    end
  
    def to_json()
        printer.to_json(self)
    end
end