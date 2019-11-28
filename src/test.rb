# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'optparse'
# TODO: Solargraph could not resolve it...
require 'artii'
require 'paint'

puts(
  Paint[
    Artii::Base.new.asciify('my-cli-test'),
    :red
  ]
)

options = { cheese: true }
prog = OptionParser.new do |opts|
  opts.version = '0.0.1'
  opts.banner = "Usage: cli [options]

An example CLI for ordering pizza"

  opts.on('-p', '--peppers', 'Add peppers') do
    options[:peppers] = true
  end
  opts.on('-P', '--pineapple', 'Add pineapple') do
    options[:pineapple] = true
  end
  opts.on('-b', '--bbq', 'Add bbq sauce') do
    options[:bbq] = true
  end
  opts.on('-c', '--cheese <type>', 'Add the specified type of cheese [marble]') do |o|
    options[:cheese_type] = o
  end
  opts.on('-C', '--no-cheese', 'You do not want any cheese') do
    options[:cheese] = false
  end
  opts.on('-h', '--help', 'display help for command') do
    puts opts
    exit
  end
end

prog.parse!(['--help']) if ARGV.empty?

prog.parse!

puts('you ordered a pizza with:')
puts('  - peppers') if options[:peppers]
puts('  - pineapple') if options[:pineapple]
puts('  - bbq') if options[:bbq]
cheese = if options[:cheese]
           options[:cheese_type] || 'marble'
         else
           'no'
         end
puts("  - #{cheese} cheese")
