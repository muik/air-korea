module AirKorea
  module Resource
    class Regions
      include Singleton

      def get()
        url = 'http://www.airkorea.or.kr/stationInfo'
        html = Net::HTTP.get(URI(url))
        html = html.force_encoding(Encoding::UTF_8)
        results = html.scan(/<area class="sub_gis_map_\d+" alt="([^"]+)"\s+href="javascript:searchInfo\('(\d+)',\s?'(\d+)','(\d+)/)
        regions = []
        for data in results
          regions.append({
            code: data[1],
            name: data[0],
            no: data[3],
            station_code: data[2],
          })
        end
        regions
      end
    end
  end
end

