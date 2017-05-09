class LogEntry
  attr_accessor :request_to, :response_status
  def initialize(log_entry)
    hash              = string_to_hash(log_entry)

    @request_to       = hash[:request_to]
    @response_status  = hash[:response_status].to_i
  end

  private

  def string_to_hash(string)
    hash = {}
    string.gsub(/[\\\"]/, "")
          .split(' ')
          .map { |s| s.split('=') }
          .each do |key, value|
      hash[key.to_sym] = value
    end
    hash
  end
end