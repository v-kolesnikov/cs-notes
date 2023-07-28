require 'packetfu'
filename = 'telnet-raw.pcap'
packet_array = PacketFu::PcapFile.file_to_array(filename)
