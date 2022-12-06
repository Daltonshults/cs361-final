class TrackToJSON

    def to_json(track)
      jsonString = '{"type": "Feature", '
  
      if ! track.name.empty?
        jsonString+= '"properties": {"title": "'\
                      + track.name + '"},'
      end
  
      jsonString += '"geometry": {"type":'\
                    '"MultiLineString","coordinates": ['
  
      # Loop through all the segment objects
      track.segments.each_with_index do |seg, index|

        if index > 0
          jsonString += ","
        end
  
        jsonString += '['
  
        # Loop through all the coordinates in the segment
        cordinateString = ''
        
        seg.coordinates.each do |cord|
  
          if ! cordinateString.empty?
            cordinateString += ','
          end
  
          # Add the coordinate
          cordinateString += "[#{cord.lon},#{cord.lat}"
  
          if !cord.ele.empty?
            cordinateString += ",#{cord.ele}"
          end

          cordinateString += ']'
        end
  
        jsonString+=cordinateString + ']'
  
      end
  
      jsonString + ']}}'
    end
    
end
