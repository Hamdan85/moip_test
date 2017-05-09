require_relative 'log_entry'

# LogParser is a object that merges all the information about the log file
class LogParser

  attr_accessor :entries

  def initialize(file)
    file        = file.readlines
    @entries    = []

    create_entries(file)
  end

  def most_accessed
    organize_entries[0..3].reverse.each do |host, accessess|
      puts "#{host} - #{accessess}"
    end
  end

  def code_count
    code_counts.reverse.each do |code, count|
      puts "#{code} - #{count}"
    end
  end

  private

  def create_entries(file)
    file.each do |line|
      line = reformat_encode(line)
      create_entry(line) if line.match(/level/)
    end
  end

  def create_entry(entry_line)
    @entries << LogEntry.new(entry_line)
  end

  def reformat_encode(str)
    unless str.valid_encoding?
      str = str.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
    end
    str
  end

  def organize_entries
    entries = self.entries.map { |entry| entry.request_to }
    uniq_entries = entries.uniq

    hash = {}

    uniq_entries.each do |entry|
      hash[entry.to_sym] = entries.select { |e| e == entry }.size
    end

    hash.sort_by {|k, v| v }
  end

  def code_counts
    codes       = self.entries.map { |entry| entry.response_status }
    uniq_codes  = codes.uniq

    result = {}

    uniq_codes.each do |code|
      result[code] = codes.select { |entry_code| entry_code == code }.count
    end

    result.sort_by {|k, v| v }
  end
end