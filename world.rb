class World
    def initialize(name, points)
      @name = name
      @features = points
    end
      def add_feature(f)
        @features.append(t)
      end
    
      def to_geojson(indent=0)
    
        # Write stuff
        stringOut = '{"type": "FeatureCollection","features": ['
    
        @features.each_with_index do |f,i|
          if i != 0
            stringOut +=","
          end
    
            stringOut += f.to_json    
        end
    
        stringOut + "]}"
      end
    end