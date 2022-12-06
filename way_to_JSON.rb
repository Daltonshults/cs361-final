class WayToJSON
  
    def to_json(indent=0, waypoint)
    
      jsonString = '{"type": "Feature",'
    
      # if name is not nil or type is not nil
      jsonString += '"geometry": {"type": "Point","coordinates": ' \
                    + "[#{waypoint.lon},#{waypoint.lat}"
      
      if waypoint.ele < 300000
        jsonString += ",#{waypoint.ele}"
      end
      
        jsonString += ']},'
      
        if !waypoint.name.empty? or !waypoint.type.empty?
          jsonString += '"properties": {'
            
          if !waypoint.name.empty?
            jsonString += '"title": "' + waypoint.name + '"'
          end
        
          if !waypoint.type.empty? 
          
            if !waypoint.name.empty?
              jsonString += ','
            end
          
            jsonString += '"icon": "' + waypoint.type + '"'  # type is the icon    
          end
        
          jsonString += '}'
        
        end
      
        jsonString += "}"
      
    end

end