require_relative 'gis.rb'
require 'json'
require 'test/unit'

class TestGis < Test::Unit::TestCase

  def test_waypoints
    printer = PrintWay.new()
    w = Waypoint.new(-121.5, 45.5, 30, "home", "flag", printer)
    expected = JSON.parse('{"type": "Feature","properties": {"title": "home","icon": "flag"},"geometry": {"type": "Point","coordinates": [-121.5,45.5,30]}}')
    result = JSON.parse(w.to_json)
    assert_equal(result, expected)

    w = Waypoint.new(-121.5, 45.5, nil, nil, "flag", printer)
    expected = JSON.parse('{"type": "Feature","properties": {"icon": "flag"},"geometry": {"type": "Point","coordinates": [-121.5,45.5]}}')
    result = JSON.parse(w.to_json)
    assert_equal(result, expected)

    w = Waypoint.new(-121.5, 45.5, nil, "store", nil, printer)
    expected = JSON.parse('{"type": "Feature","properties": {"title": "store"},"geometry": {"type": "Point","coordinates": [-121.5,45.5]}}')
    result = JSON.parse(w.to_json)
    assert_equal(result, expected)
  end

  def test_tracks
    ts1 = TrackSegment.new([
      Point.new(-122, 45),
      Point.new(-122, 46),
      Point.new(-121, 46),
    ])

    ts2 = TrackSegment.new([ Point.new(-121, 45), Point.new(-121, 46), ])

    ts3 = TrackSegment.new([
      Point.new(-121, 45.5),
      Point.new(-122, 45.5),
    ])
    printer = PrintTrack.new()
    t = Track.new([ts1, ts2], "track 1", printer)
    expected = JSON.parse('{"type": "Feature", "properties": {"title": "track 1"},"geometry": {"type": "MultiLineString","coordinates": [[[-122,45],[-122,46],[-121,46]],[[-121,45],[-121,46]]]}}')
    result = JSON.parse(t.to_json)
    assert_equal(expected, result)

    t = Track.new([ts3], "track 2", printer)
    expected = JSON.parse('{"type": "Feature", "properties": {"title": "track 2"},"geometry": {"type": "MultiLineString","coordinates": [[[-121,45.5],[-122,45.5]]]}}')
    result = JSON.parse(t.to_json)
    assert_equal(expected, result)
  end

  def test_world
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

    w = World.new("My Data", [w, w2, t, t2])

    expected = JSON.parse('{"type": "FeatureCollection","features": [{"type": "Feature","properties": {"title": "home","icon": "flag"},"geometry": {"type": "Point","coordinates": [-121.5,45.5,30]}},{"type": "Feature","properties": {"title": "store","icon": "dot"},"geometry": {"type": "Point","coordinates": [-121.5,45.6]}},{"type": "Feature", "properties": {"title": "track 1"},"geometry": {"type": "MultiLineString","coordinates": [[[-122,45],[-122,46],[-121,46]],[[-121,45],[-121,46]]]}},{"type": "Feature", "properties": {"title": "track 2"},"geometry": {"type": "MultiLineString","coordinates": [[[-121,45.5],[-122,45.5]]]}}]}')
    result = JSON.parse(w.to_geojson)
    assert_equal(expected, result)
  end

end
