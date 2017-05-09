require_relative 'lib/log_parser'

file_path = ARGV.first

file = File.open(file_path, 'r')

log_parser = LogParser.new(file)

log_parser.most_accessed

log_parser.code_count
