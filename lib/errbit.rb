require "open-uri"
require "json"

class Errbit

  attr_reader :api_key, :base_uri, :date_format, :response

  def initialize(options)
    @api_key     = options[:api_key]
    @base_uri    = options[:base_uri]
    @date_format = options[:date_format]
    @response    = parse URI.parse(errbit_path).read
  end

  def values
    {
      name:    name,
      status:  status,
      date:    date,
      errors:  errors
    }
  end

  private

  def name
    response[:name]
  end

  def status
    errors == 0 ? "green" : "red"
  end

  def date
    DateTime.parse(response[:last_error_time]).strftime date_format if response[:last_error_time]
  end

  def errors
    response[:unresolved_errors]
  end

  def parse(data)
    JSON.parse data, symbolize_names: true
  end

  def errbit_path
    "#{base_uri}/api/v1/stats/app?api_key=#{api_key}"
  end

end
