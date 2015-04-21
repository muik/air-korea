module AirKorea
  class Client
    Dir[File.expand_path('../resource/*.rb', __FILE__)].each{|f| require f}

    def initialize(options)
    end

    def forecasts
      AirKorea::Resource::Forecast.instance.get()
    end

    def regions
      AirKorea::Resource::Regions.instance.get()
    end

    def stations(region_code, station_code, region_no)
      AirKorea::Resource::Stations.instance.get(region_code, station_code, region_no)
    end

    def measures(station_code)
      AirKorea::Resource::Measures.instance.get(station_code)
    end
  end
end
