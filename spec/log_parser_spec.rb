require './spec/spec_helper'
require './bin/lib/log_parser'

RSpec.describe LogParser do

  file_path = 'spec/log_files/log.txt'

  it "must receive a file path as argument" do
    expect { LogParser.new }.to raise_error ArgumentError
  end

  it "must create an entry for each webhook log" do
    log_parser = LogParser.new(file_path)
    expect(log_parser).to respond_to :entries
    expect(log_parser.entries.size).to eql 10000
  end

  it "must output the three more accessed url's and their number of accessess" do
    log_parser = LogParser.new(file_path)
    expect(log_parser).to respond_to :most_accessed
  end


  it "must output a table with each status and their number of occurence" do
    log_parser = LogParser.new(file_path)
    expect(log_parser).to respond_to :code_count
  end
end