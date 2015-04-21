module AirKorea
  module Resource
    class Stations
      include Singleton

      def get(region_code, station_code, region_no)
        html = get_html(region_code, station_code, region_no)
        results = html.scan(/\)">([^<]+)<\/a><\/td>\s+\n.+vrmlSearch\('(\d+)', '(\d+)', '(\d+)'\)">([^<]+)/)

        stations = []
        for data in results
          stations.append({
            region_code: data[2],
            code: data[1],
            name: data[0],
            no: data[3],
            address: data[4],
          })
        end
        stations
      end

      private
      def get_html(region_code, station_code, region_no)
        http = Net::HTTP
        url = 'http://www.airkorea.or.kr/stationInfo'
        uri = URI(url)
        res = http.post_form(uri, {
          action: 'station',
          loading: 'yes',
          leftShow: 'realTime',
          districtnum: region_code,
          stationCode: station_code,
          areaImg: region_no
        })
        html = res.body
        html.force_encoding(Encoding::UTF_8)
      end
    end
  end
end
