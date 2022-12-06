#!/usr/bin/env ruby
require_relative 'track.rb'
require_relative 'tracksegment'
require_relative 'point'
require_relative 'waypoint'
require_relative 'world'
require_relative 'printway'
require_relative 'trackprint'

def main()
  printer = PrintWay.new()
  w = Waypoint.new(-121.5, 45.5, 30, "home", "flag", printer)
  w2 = Waypoint.new(-121.5, 45.6, nil, "store", "dot", printer)
  
  ts1 = TrackSegment.new([
    Point.new(-122, 45),
    Point.new(-122, 46),
    Point.new(-121, 46),
  ])

  ts2 = TrackSegment.new([
    Point.new(-121, 45),
    Point.new(-121, 46), ])

  ts3 = TrackSegment.new([
    Point.new(-121, 45.5),
    Point.new(-122, 45.5),
  ])
  
  printer = PrintTrack.new()
  t = Track.new([ts1, ts2], "track 1", printer)
  t2 = Track.new([ts3], "track 2", printer)

  world = World.new("My Data", [w, w2, t, t2])

  puts world.to_geojson()
end

if File.identical?(__FILE__, $0)
  main()
end