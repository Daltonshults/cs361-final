class PrintWay
    def to_json(indent=0, waypoint)
        jsonString = '{"type": "Feature",'
        # if name is not nil or type is not nil
        jsonString += '"geometry": {"type": "Point","coordinates": ' \
                      + "[#{waypoint.lon},#{waypoint.lat}"
    
        if waypoint.ele != nil
          jsonString += ",#{waypoint.ele}"
        end
    
        jsonString += ']},'
    
        if waypoint.name != "" or waypoint.type != nil
          jsonString += '"properties": {'
          
          if waypoint.name != nil
            jsonString += '"title": "' + waypoint.name + '"'
          end
    
          if waypoint.type != nil  # if type is not nil
    
            if waypoint.name != nil
              jsonString += ','
            end
    
            jsonString += '"icon": "' + waypoint.type + '"'  # type is the icon
    
          end
    
          jsonString += '}'
    
        end
    
        jsonString += "}"
        return jsonString    
    end
end