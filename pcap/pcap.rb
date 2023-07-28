#!/usr/bin/env ruby

# frozen_string_literal: true

# PCAP Capture File Format
# https://datatracker.ietf.org/doc/id/draft-gharris-opsawg-pcap-00.html
#
# A capture file begins with a File Header, followed by zero or more Packet Records, one per packet.
#
# File header
#                            1                   2                   3
#        0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#     0 |                          Magic Number                         |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#     4 |          Major Version        |         Minor Version         |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#     8 |                           Reserved1                           |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#    12 |                           Reserved2                           |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#    16 |                            SnapLen                            |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#    20 | FCS |f|                   LinkType                            |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#
#
# Packet Record
#                           1                   2                   3
#       0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#     0 |                      Timestamp (Seconds)                      |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#     4 |            Timestamp (Microseconds or nanoseconds)            |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#     8 |                    Captured Packet Length                     |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#    12 |                    Original Packet Length                     |
#       +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
#    16 /                                                               /
#       /                          Packet Data                          /
#       /                        variable length                        /
#       /                                                               /
#       +---------------------------------------------------------------+

ARGV => filename, *_

filename ||= 'telnet-raw.pcap'
io = File.open(filename, 'rb')
header =
  begin
    bytes = io.read(24)
    magic_number  = bytes[0..4].unpack1('V').to_s(16)
    major_version = bytes[4..6].unpack1('S')
    minor_version = bytes[6..8].unpack1('S')
    snap_len = bytes[16..20].unpack1('V')
    {magic_number:, major_version:, minor_version:, snap_len:,}
  end
io.close

puts header

puts(
  header[:magic_number].to_s.center(32),
  [header[:major_version].to_s.center(16), header[:minor_version].to_s.center(16)].join('').center(32),
  0.to_s.center(32),
  0.to_s.center(32),
  header[:snap_len].to_s.center(32),
)
