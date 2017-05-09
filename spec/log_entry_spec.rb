require './spec/spec_helper'
require './bin/lib/log_entry'

RSpec.describe LogEntry do

  line_string = File.readlines('spec/log_files/log.txt')[3].gsub(/[\\\"]/,"")

  it "must receive one line of the log file as argument" do
    expect { LogEntry.new }.to raise_error ArgumentError
  end

  it "must parametrize request_to" do
    log_entry = LogEntry.new(line_string)
    expect(log_entry).to respond_to(:request_to)
    expect(log_entry.request_to).to eq "https://severeleather.com"

  end

  it "must parametrize response_status code" do
    log_entry = LogEntry.new(line_string)
    expect(log_entry).to respond_to(:response_status)
    expect(log_entry.response_status).to eq 500
  end
end