# Moip - Test

This repository helps to parse a log file in order to gather info about webhooks accesses through a log file.

In order to make it easily mantained, the log file was structured in a Class named LogEntry which can be enriched with
the other parameters of the log file.

## Usage

You can use it with their classes or through a command line:

* Using as a Class

```ruby
require './bin/lib/log_parser'
file_path   = 'example/path/to/log_file.txt'
file        = File.open(file_path, 'r')
log_parser  = LogParser.new(file)
```
So you can get the analysis through methods:

```ruby
log_parser.most_accessed
log_parser.code_count
```

* Using as a command line
```
$ ruby ./bin/moip_test.rb example/path/to/log_file.txt
```

The command returns:

```ruby
https://severeleather.com - 693
https://endlessiron.com.br - 688
https://woodenoyster.com.br - 685
https://steepBoomerang.me - 677
404 - 1474
503 - 1451
400 - 1440
500 - 1428
200 - 1417
201 - 1402
204 - 1388
```

## Testing
In order to test the respository, you should run:
```
$ rspec
```