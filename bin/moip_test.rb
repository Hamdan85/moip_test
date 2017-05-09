require_relative 'lib/log_parser'

file_path = ARGV.first

log_parser = LogParser.new(file_path)

log_parser.most_accessed

log_parser.code_count
