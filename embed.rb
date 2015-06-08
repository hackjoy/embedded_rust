require 'ffi'
require 'benchmark'

module EmbeddedRust
  extend FFI::Library
  ffi_lib 'target/release/libembed.dylib'
  # attach rust function with no argument, returns void.
  attach_function :process, [], :void
end

Benchmark.bm(10) do |x|
  puts "Embedded Rust"
  x.report { EmbeddedRust.process }
  puts ""
end

module PureRuby
  def self.process
    threads = []

    10.times do
      threads << Thread.new do
        count = 0

        5_000_000.times do
          count += 1
        end
      end
    end

    threads.each {|t| t.join }
  end
end

Benchmark.bm(10) do |x|
  puts "Pure Ruby"
  x.report { PureRuby.process }
  puts ""
end
