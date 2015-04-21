module AirKorea
  module Resource
    class Measures
      include Singleton

      def get(station_code)
        http = Net::HTTP
        url = "http://www.airkorea.or.kr/web/pollution/getRealChart?dateDiv=1&period=1&stationCode=#{station_code}"
        json = http.get(URI(url))
        obj = JSON.parse json
        charts = obj['charts']
        charts.collect do |data|
          {
            time: Time.strptime(data['DATA_TIME'], '%m-%d:%H'),
            grade: data['KHAI_GRADE'],
            index: data['KHAI_VALUE'],
            major: data['KHAI_ITEM_CODE'],
          }
        end
      end
    end
  end
end
