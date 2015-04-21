require 'air_korea/client'

module AirKorea
  def self.client(options={})
    AirKorea::Client.new(options)
  end
end
