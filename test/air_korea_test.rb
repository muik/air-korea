require 'test_helper'

class AirKoreaTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, AirKorea
  end

  test "regions" do
    client = AirKorea.client
    regions = client.regions
    assert_not_nil regions
    forecasts = client.forecasts
    assert_not_nil forecasts
    assert forecasts.count > 0

    region = regions.first
    stations = client.stations(region[:code], region[:station_code], region[:no])
    assert_not_nil stations
    assert stations.count > 0
    stations.each {|s| assert region[:code] == s[:region_code]}

    station = stations.first
    assert_not_nil station
    measures = client.measures(station[:code])
    assert_not_nil measures
    assert measures.count > 0
  end

  test "forecasts" do
    client = AirKorea.client
    result = client.forecasts
    assert_not_nil result
    assert_not_nil result[:date]
    assert_not_nil result[:today]
  end
end
