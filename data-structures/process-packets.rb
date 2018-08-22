#/usr/bin/env ruby
require 'pp'

Packet = Struct.new(:arrival_time, :process_time)
Response = Struct.new(:start_time, :dropped)

class Processor
  def initialize(buf_size)
    @buf_size = buf_size
  end

  def process(packets)
    buffer = []
    packets.each.with_index.map do |packet, idx|
      add_packet(packet, buffer)
    end
  end

  private

  def full?(buffer)
    buffer.size == @buf_size
  end

  def add_packet(packet, buffer)
    remove_outdated(packet.arrival_time, buffer)

    return Response.new(-1, true) if full?(buffer)
    start_time = buffer.empty? ? packet.arrival_time : buffer[-1]
    buffer << start_time + packet.process_time

    Response.new(start_time, false)
  end

  def remove_outdated(current_time, buffer)
    while !buffer.empty? && buffer[0] <= current_time
      buffer.shift
    end
  end
end


data = STDIN.read.split.map(&:to_i)
buf_size = data.shift
n = data.shift
packets = data.each_slice(2).map { |arrival, duration| Packet.new(arrival, duration) }

responses = Processor.new(buf_size).process(packets)

puts responses.map { |resp| resp.dropped ? -1 : resp.start_time }
