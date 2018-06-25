require 'faraday'
require 'faraday_middleware'

class Connection
  def initialize(configuration)
    @configuration = configuration
    @connection = Faraday.new(url: configuration.endpoint) do |faraday|
      if configuration.debug
        faraday.request :logger
        faraday.response :logger
        faraday.use :instrumentation
      end

      faraday.use Faraday::Response::RaiseError
      faraday.request :json
      faraday.response :json, :content_type => /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end

  [:get, :post, :delete].each do |method|
    define_method(method) do |url, params={}|
      @connection.send(method, url, params)
    end
  end
end
