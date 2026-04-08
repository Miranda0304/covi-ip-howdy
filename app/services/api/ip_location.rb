require "rest-client"
require "json"

module Api
  class IpLocation
    # 172.217.20.46
    # 149.202.109.223
    # 5.39.97.151
    API_URL = "https://jsonmock.hackerrank.com/api/ip"

    def initialize(ip:)
      @ip = ip
    end

    def call
      validate!(@ip)
      response = RestClient.get("#{API_URL}/#{@ip}")
      parse_response(response)
    rescue RestClient::ExceptionWithResponse => e
      handle_error(e)
    rescue StandardError => e
      { error: e.message }
    end

    private

    def validate!(ip)
      return unless ip.blank?
      raise StandardError, "The IP is mandatory."
    end

    def parse_response(response)
      res = JSON.parse(response.body)["data"]
      {
        ip: res["ip"],
        country: res["country"],
        language: res["language"],
      }
    end

    def handle_error(error)
      {
        error: true,
        status: error.response&.code,
        body: error.response&.body,
      }
    end
  end
end
